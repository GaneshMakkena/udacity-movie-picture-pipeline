# Movie Picture Pipeline - Implementation Notes

## Workflows

The project contains four workflows under `.github/workflows`:

- `frontend-ci.yaml` - pull requests to `main` that change `starter/frontend/**`; runs lint and tests in parallel, then builds the Docker image.
- `backend-ci.yaml` - pull requests to `main` that change `starter/backend/**`; runs Flake8 and pytest in parallel, then builds the Docker image.
- `frontend-cd.yaml` - pushes to `main` that change `starter/frontend/**`, or a manual run; runs quality checks, builds and pushes a SHA-tagged image to ECR, then deploys the Kubernetes manifests.
- `backend-cd.yaml` - pushes to `main` that change `starter/backend/**`, or a manual run; runs quality checks, builds and pushes a SHA-tagged image to ECR, then deploys the Kubernetes manifests.

Every workflow has a manual `workflow_dispatch` trigger. CI build jobs use `needs: [lint, test]`, and CD deploy jobs use `needs: build`, so a failed quality check prevents a build or deployment.

## GitHub configuration needed before running CD

Add these repository secrets:

- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`

Add this repository variable:

- `BACKEND_API_URL` - the reachable base URL of the deployed backend service, including the scheme and without a trailing slash. The frontend Docker build passes it as `REACT_APP_MOVIE_API_URL`.

The workflows use the fixed Terraform values from the starter project: AWS region `us-east-1`, ECR repositories `frontend` and `backend`, and EKS cluster `cluster`.

## Local verification

From `starter/frontend`:

```bash
npm ci
npm run lint
CI=true npm test -- --watchAll=false
REACT_APP_MOVIE_API_URL=http://127.0.0.1:5000 npm run build
```

From `starter/backend` with Pipenv configured:

```bash
pipenv install --dev --deploy
pipenv run lint
pipenv run test
```

The `evidence` directory contains local screenshots showing the frontend movie list and the backend `/movies` response. AWS/EKS resources were not created as part of local verification; the supplied Terraform and setup scripts remain available for the authorized deployment step.
