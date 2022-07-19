.PHONY: help
help:  ## Print the help documentation
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: build_latest
build_latest:  ## Builds and Pushes Stable Image
	@echo "Building/Pushing for latest"
	docker buildx build --platform linux/amd64,linux/arm64 -f Dockerfile -t bmltenabled/uvicorn-gunicorn:latest . --push

.PHONY: build_stable
build_stable:  ## Builds and Pushes Stable Image
	@echo "Building/Pushing for stable"
	docker buildx build --platform linux/amd64,linux/arm64 -f Dockerfile -t bmltenabled/uvicorn-gunicorn:latest . --push
