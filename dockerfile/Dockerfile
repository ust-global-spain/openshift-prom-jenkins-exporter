FROM centos:7

ARG EXPORTER_VERSION=1.2.0
ENV EXPORTER_VERSION=${EXPORTER_VERSION}
ARG EXPORTER_PROJECT=https://github.com/ust-global-spain/jenkins_exporter
ENV JENKINS_URL=http://jenkins:8080
ENV JENKINS_USER=""
ENV JENKINS_PASSWORD=""
ENV APP_PORT=9118
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

RUN \
	yum -y install epel-release && \
	yum install -y unzip && \
	yum install -y python-pip && \
	curl -L ${EXPORTER_PROJECT}/archive/${EXPORTER_VERSION}.zip -o /tmp/jenkins_exporter.zip && \
	mkdir -p /opt/jenkins_exporter && \
	unzip /tmp/jenkins_exporter.zip -d /opt && \
	chmod +x /usr/local/bin/docker-entrypoint.sh && \
	chmod -R g+rwx /opt/jenkins_exporter-${EXPORTER_VERSION}/jenkins_exporter.py && \
	pip install --no-cache-dir -r /opt/jenkins_exporter-${EXPORTER_VERSION}/requirements.txt && \
	rm /tmp/jenkins_exporter.zip  && \
	yum clean all

EXPOSE ${APP_PORT}

USER 1001
ENTRYPOINT ["docker-entrypoint.sh"]
