# Stage 1: install dependencies (we keep dev deps for build)
FROM node:18-alpine AS deps
WORKDIR /app
# copy only package files (better cache)
COPY package.json package-lock.json* ./ 
RUN npm ci

# Stage 2: build the app
FROM node:18-alpine AS builder
WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY . .
# build Next.js production assets
RUN npm run build

# Stage 3: production image (smaller)
FROM node:18-alpine AS runner
WORKDIR /app
ENV NODE_ENV=production
# copy only necessary files from builder
COPY --from=builder /app/.next ./.next
COPY --from=builder /app/public ./public
COPY --from=builder /app/package.json ./package.json
COPY --from=builder /app/node_modules ./node_modules
EXPOSE 3000
# use next start to run the optimized production build
CMD ["npm", "start"]
