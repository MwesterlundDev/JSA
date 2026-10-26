.PHONY: up down

up:
	kind create cluster --config deploy/kind-config.yaml || true
	kubectl config use-context kind-jsa

down:
	kind delete cluster --name jsa
