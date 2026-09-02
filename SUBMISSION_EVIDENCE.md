# Movie Picture Pipeline — Submission Evidence

This file is the evidence index for the resubmission. The deployment values and
links below will be filled in after the public repository has a successful
GitHub Actions deployment to EKS.

## Public repository

- Repository: `PENDING_PUBLIC_REPOSITORY_URL`
- Verified deployment commit: `PENDING_COMMIT_SHA`

## Successful GitHub Actions runs

- Frontend Continuous Integration: `PENDING_FRONTEND_CI_RUN_URL`
- Backend Continuous Integration: `PENDING_BACKEND_CI_RUN_URL`
- Frontend Continuous Deployment: `PENDING_FRONTEND_CD_RUN_URL`
- Backend Continuous Deployment: `PENDING_BACKEND_CD_RUN_URL`

## Deployed application URLs

- Frontend application: `PENDING_FRONTEND_LOAD_BALANCER_URL`
- Backend API (`/movies`): `PENDING_BACKEND_LOAD_BALANCER_URL/movies`

## ECR images

- Frontend image/tag: `PENDING_FRONTEND_ECR_IMAGE`
- Backend image/tag: `PENDING_BACKEND_ECR_IMAGE`

## Evidence files

The final repository will contain these reviewer-facing artifacts under
`evidence/`:

- `frontend-eks.jpeg` — frontend movie list open through its EKS LoadBalancer DNS.
- `backend-eks.jpeg` — backend `/movies` response open through its EKS LoadBalancer URL.
- `kubectl-get-all.txt` — running frontend/backend Kubernetes resources.
- `kubectl-describe-frontend.txt` — frontend deployment details.
- `kubectl-describe-backend.txt` — backend deployment details.
- `ecr-images.txt` — latest frontend and backend ECR image details.
- `github-actions-success.jpeg` — GitHub Actions page showing successful runs.

The local screenshots from the pre-deployment smoke test are retained only as
development evidence; the EKS artifacts above are the submission evidence.
