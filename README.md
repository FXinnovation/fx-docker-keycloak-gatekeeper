# keycloak-gatekeeper
## Description
keycloak-gatekeeper in a container. Allows you to run an identity aware proxy in front of any application.

## Tags
We do NOT push a `latest` tag for this image. You should always pin a specific version when using it.

## Usage
```
docker run -d  \
  -v [PATH_TO_CONFIG]:/opt/keycloak/gatekeeper/conf.d \
  fxinnovation/keycloak-gatekeeper:[TAG]
```

Please refer to [keycloak-gatekeeper](https://www.keycloak.org/docs/latest/securing_apps/index.html#_keycloak_generic_adapter) documentation to know what to put in the configuration file.

### Kubernetes
For kubernetes, we suggest you mount the configuration under the form of a configmap.

## Labels
We set labels on our images with additional information on the image. we follow the guidelines defined at http://label-schema.org/. Visit their website for more information about those labels.

## Comments & Issues
If you have comments or detect an issue, please be advised we don't check the docker hub comments. You can always contact us through the repository.
