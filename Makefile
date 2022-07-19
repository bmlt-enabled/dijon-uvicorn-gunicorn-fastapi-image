.PHONY: help
help:  ## Print the help documentation
	@grep -E '^[a-zA-Z0-9_.-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: build_python3.9
build_python3.9:  ## Builds and Pushes Python 3.9 Image
	@echo "Building/Pushing for latest"
	docker buildx build --platform linux/amd64,linux/arm64 -f python3.9-slim.dockerfile -t bmltenabled/uvicorn-gunicorn-fastapi:python3.9-slim . --push

.PHONY: build_python3.10
build_python3.10:  ## Builds and Pushes Python 3.10 Image
	@echo "Building/Pushing for latest"
	docker buildx build --platform linux/amd64,linux/arm64 -f python3.10-slim.dockerfile -t bmltenabled/uvicorn-gunicorn-fastapi:python3.10-slim . --push
