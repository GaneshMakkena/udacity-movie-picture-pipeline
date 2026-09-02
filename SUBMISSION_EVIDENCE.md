# Movie Picture Pipeline — Submission Evidence

This document indexes the complete public repository and the verified EKS deployment used for resubmission.

## Public repository

- Repository: [GaneshMakkena/udacity-movie-picture-pipeline](https://github.com/GaneshMakkena/udacity-movie-picture-pipeline)
- Branch: `main`
- Verified deployment commit: `b68c63fadf332e7ff22e7afb3c688981a32a4026`
- AWS region: `us-east-1`
- EKS cluster: `cluster` (Kubernetes `1.32`)

The repository root contains the complete `starter/` application source, `setup/` Terraform and initialization files, README and project notes, all required workflows, and this evidence package. It is not a workflow-only archive.

## Successful GitHub Actions runs

The following required workflows have successful runs in the public repository:

- [Frontend Continuous Integration — run 33634213650](https://github.com/GaneshMakkena/udacity-movie-picture-pipeline/actions/runs/33634213650) — lint, tests, cache, and Docker build gate.
- [Backend Continuous Integration — run 33634217811](https://github.com/GaneshMakkena/udacity-movie-picture-pipeline/actions/runs/33634217811) — lint, tests, cache, and Docker build gate.
- [Frontend Continuous Deployment — run 33633022744](https://github.com/GaneshMakkena/udacity-movie-picture-pipeline/actions/runs/33633022744) — SHA-tagged ECR image and EKS rollout.
- [Backend Continuous Deployment — run 33632301854](https://github.com/GaneshMakkena/udacity-movie-picture-pipeline/actions/runs/33632301854) — SHA-tagged ECR image and EKS rollout.
- [Deployment Evidence — run 33633525345](https://github.com/GaneshMakkena/udacity-movie-picture-pipeline/actions/runs/33633525345) — rollout verification and evidence collection.

The CI runs were manually dispatched on the current `main` revision after the deployment was verified. The CD runs deployed commit `b68c63fadf332e7ff22e7afb3c688981a32a4026`. The public Actions page screenshot is filtered to successful results.

## Deployed application URLs

- Frontend application: [EKS frontend LoadBalancer](http://a73fe3fe2c630419888d365db3dede07-1392143434.us-east-1.elb.amazonaws.com)
- Backend API: [EKS backend `/movies` endpoint](http://a503da845620843d8aac33b6dd0d4455-1293951574.us-east-1.elb.amazonaws.com/movies)

The backend response was verified to contain the three supplied movies: `Top Gun: Maverick`, `Sonic the Hedgehog`, and `A Quiet Place`. The frontend screenshot shows the same three titles rendered through the frontend LoadBalancer URL.

## ECR images

Both production deployments use the verified Git commit SHA as the image tag:

- Frontend: `026585845151.dkr.ecr.us-east-1.amazonaws.com/frontend:b68c63fadf332e7ff22e7afb3c688981a32a4026`
  - Digest: `sha256:9b3d0f80497e2ae9ec3e874592f9cb862cb1c09169a0ff66337552047480db6a`
  - Pushed: `2026-09-02T13:00:53.244000+00:00`
- Backend: `026585845151.dkr.ecr.us-east-1.amazonaws.com/backend:b68c63fadf332e7ff22e7afb3c688981a32a4026`
  - Digest: `sha256:3eeee42027b2e30a16038e940ee693b30872d59bc7fd4106eecdb9b65b20c5fd`
  - Pushed: `2026-09-02T12:53:02.434000+00:00`

## Evidence files

The reviewer-facing artifacts are committed under `evidence/`:

- `evidence/frontend-eks.jpeg` — frontend movie list open through its EKS LoadBalancer DNS, with the URL visible.
- `evidence/backend-eks.jpeg` — backend `/movies` JSON response open through its EKS LoadBalancer URL.
- `evidence/github-actions-success.jpeg` — public GitHub Actions page showing successful workflow results.
- `evidence/kubectl-get-all.txt` — running frontend/backend pods, Services, Deployments, and ReplicaSets.
- `evidence/kubectl-describe-frontend.txt` — frontend deployment description and SHA-tagged image.
- `evidence/kubectl-describe-backend.txt` — backend deployment description and SHA-tagged image.
- `evidence/ecr-images.txt` — ECR image tags, digests, sizes, and push timestamps.
- `evidence/deployed-images.txt` — image references reported by the live Kubernetes deployments.
- `evidence/endpoints.txt` — verified frontend and backend LoadBalancer URLs.
- `evidence/backend-movies.json` — captured backend response containing all three movies.
- `evidence/frontend.html` — captured frontend HTML from the deployed LoadBalancer.

No AWS credentials, session tokens, or other secret values are included in the repository, evidence files, screenshots, or this document. Temporary generated dependencies, Terraform state, and local caches remain excluded by the repository ignore rules.
