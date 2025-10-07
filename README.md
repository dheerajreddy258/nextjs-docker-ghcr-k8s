# 🚀 Next.js Docker + GitHub Actions + Kubernetes (Minikube)

This project demonstrates how to **containerize** a Next.js application, **automate image builds** with GitHub Actions and **deploy it** to a local Kubernetes cluster using **Minikube**.

---

## 🧰 Tech Stack
- **Next.js** (frontend framework)
- **Docker** (containerization)
- **GitHub Actions** (CI/CD automation)
- **GitHub Container Registry (GHCR)** (image hosting)
- **Kubernetes (Minikube)** (deployment platform)

---

## 🏗️ Project Setup

### 1. Clone the repo
```bash
git clone https://github.com/dheerajreddy258/nextjs-docker-ghcr-k8s.git
cd nextjs-docker-ghcr-k8s
```

### 2. Install dependencies (for local development)
```bash
npm install
npm run dev
# Open http://localhost:3000
```

---

## 🐳 Docker Setup

### Build and run locally
```bash
docker build -t my-next-app:local .
docker run --rm -p 3000:3000 my-next-app:local
# Visit http://localhost:3000
```

---

## ⚙️ CI/CD with GitHub Actions

Every push to the **main** branch triggers:
1. Docker image build
2. Push to **GitHub Container Registry (GHCR)** with tags:
   - `latest`
   - `<commit-sha>`

Image name:
```
ghcr.io/dheerajreddy258/nextjs-docker-ghcr-k8s
```

---

## ☸️ Kubernetes Deployment (Minikube)

### 1. Start Minikube
```bash
minikube start
```

### 2. Apply manifests
```bash
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
```

### 3. Verify
```bash
kubectl get pods
kubectl get svc
```

### 4. Access app
```bash
minikube service nextjs-service
# or
minikube service nextjs-service --url
```

---

## 🧠 Notes
- For private GHCR images, create a `docker-registry` secret and reference it via `imagePullSecrets`.
- Ensure your workflow token has `packages: write` permission in repository settings.
- Minikube must be running before applying Kubernetes manifests.

---


