# Tiltfile: dev loop for the local kind cluster.
# Usage: `make up` (creates cluster) then `tilt up`.

allow_k8s_contexts('kind-jsa')

docker_build(
    'jsa-api',
    '.',
    dockerfile='services/api/Dockerfile',
    only=['go.mod', 'services/api'],
)

k8s_yaml(kustomize('deploy/overlays/local'))

k8s_resource('postgres', labels=['data'])
k8s_resource('api', port_forwards=[], resource_deps=['postgres'], labels=['services'])
