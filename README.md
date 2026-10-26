# Job Search Automator

Personal job-search tool: company research, knowledge map, posting analysis.
Architecture and learning plan live in the Claude Doc "Job Search Automator: Architecture & Learning Plan".

## Prerequisites (macOS)

    brew install kind kubectl tilt-dev/tap/tilt go

Docker Desktop must be running.

## Run locally

    make up        # create the kind cluster "jsa"
    tilt up        # build, deploy, live-reload

Then:

    curl localhost:8080/healthz
    curl localhost:8080/readyz     # 200 once Postgres is up
    curl localhost:8080/api/hello

## Layout

    services/api       Go HTTP API
    deploy/base        Kustomize base manifests
    deploy/overlays    Per-environment overlays (local)
    migrations/        SQL migrations (empty for now)
    web/               SvelteKit app (later)
    prompts/           Versioned LLM prompts (later)
