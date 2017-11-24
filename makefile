.PHONY: help
.DEFAULT_GOAL := help

export BUILD_PROJECT?=devops-jenkins
export PROJECT?=devops-jenkins
export DATA_SOURCE_URI?=jenkinsql/?sslmode=disable


set-app: ## set the application
	oc new-app -f openshift/application-template-exporter.yaml \
		-p JENKINS_USER=${JENKINS_USER} \
		-p JENKINS_PASSWORD='${JENKINS_PASSWORD}' \
		-p IMAGE_NAMESPACE=${BUILD_PROJECT} \
		-n ${PROJECT}

build-app: ## build the project
	oc start-build jenkins-exporter --wait=true \
		-n ${BUILD_PROJECT}

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
