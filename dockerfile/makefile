.PHONY: help
.DEFAULT_GOAL := help

DOCKER_IMAGE?=openshift-prom-jenkins-exporter
DOCKER_REPO_READ?=ust-global-spain
DOCKER_REPO_SNAPSHOTS?=ust-global-spain
DOCKER_REPO_RELEASES?=ust-global-spain
JENKINS_URL=http://jenkins:8080
JENKINS_USER=user
JENKINS_PASSWORD=pwd

build: ## Build docker image
	@docker build -t ${DOCKER_REPO_RELEASES}${DOCKER_IMAGE} --build-arg http_proxy=${http_proxy} .

push: ## Push docker image to the repo
	docker push ${DOCKER_REPO_RELEASES}${DOCKER_IMAGE}


run-docker: ## Run the image 
	docker run -P -e JENKINS_USER="${JENKINS_USER}" \
		-e JENKINS_PASSWORD="${JENKINS_PASSWORD}" \
		-e JENKINS_URL=${JENKINS_URL} \
		--rm ${DOCKER_REPO_RELEASES}${DOCKER_IMAGE}

run-docker-ti: ## Run the image interactive
	docker run -ti --rm --entrypoint=/bin/bash ${DOCKER_REPO_RELEASES}${DOCKER_IMAGE}
	
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
	@echo -e "Arguments/env variables: \n \
			 ENV=environment  \n \
			 VAULT_PASSWORD=<vault_password>  \
				"