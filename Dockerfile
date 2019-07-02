FROM alpine:3.9

ENV KEYCLOAK_GATEKEEPER_VERSION=4.8.3.Final \
    CA_CERTIFICATES_VERSION=20190108-r0 \
    GOOS=linux \
    GOARCH=amd64

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION

ADD ./resources /resources

RUN /resources/build && rm -rf /resources

VOLUME /opt/keycloak/gatekeeper/conf.d

USER gatekeeper

ENTRYPOINT ["keycloak-gatekeeper", "--config", "/opt/keycloak/gatekeeper/conf.d/gatekeeper.yaml"]

LABEL "maintainer"="cloudsquad@fxinnovation.com" \
      "org.label-schema.name"="keycloak-gatekeeper" \
      "org.label-schema.base-image.name"="docker.io/library/alpine" \
      "org.label-schema.base-image.version"="3.9" \
      "org.label-schema.applications.keycloak-gatekeeper.version"=${KEYCLOAK_GATEKEEPER_VERSION} \
      "org.label-schema.applications.ca-certificates.version"=${CA_CERTIFICATES_VERSION} \
      "org.label-schema.description"="keycloak-gatekeeper in a container" \
      "org.label-schema.url"="https://scm.dazzlingwrench.fxinnovation.com/fxinnovation-public/docker-keycloak-gatekeeper" \
      "org.label-schema.vcs-url"="https://scm.dazzlingwrench.fxinnovation.com/fxinnovation-public/docker-keycloak-gatekeeper" \
      "org.label-schema.vendor"="FXinnovation" \
      "org.label-schema.schema-version"="1.0.0-rc.1" \
      "org.label-schema.vcs-ref"=$VCS_REF \
      "org.label-schema.version"=$VERSION \
      "org.label-schema.build-date"=$BUILD_DATE \
      "org.label-schema.usage"="docker run -v [PATH_TO_CONFIG]:/opt/keycloak/gatekeeper/conf.d fxinnovation/keycloak-gatekeeper:${VERSION}"
