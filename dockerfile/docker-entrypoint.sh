#!/usr/bin/env bash
exec python ./opt/jenkins_exporter-${EXPORTER_VERSION}/jenkins_exporter.py \
	-j ${JENKINS_URL} \
	-p ${APP_PORT} \
	--user ${JENKINS_USER} \
	--password ${JENKINS_PASSWORD}