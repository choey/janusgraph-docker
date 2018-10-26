# what is this

`janusgraph-docker` is a docker image builder for [JanusGraph](https://github.com/JanusGraph/janusgraph).

# building

Issuing `make build` builds `choey2k5/janusgraph:latest`, installing JanusGraph in `/usr/bin/janusgraph` and copying `.conf/` to `/usr/bin/janusgraph/conf/` for config overrides.

# config

Running the docker image (`make run`) will load `/usr/bin/janusgraph/conf/gremlin-server/gremlin-server.yaml`.

# overriding config

- descend `choey2k5/janusgraph` and override `./conf/gremlin-server/gremlin-server.yaml`; or
- mount `conf/` to `/usr/bin/janusgraph/conf/` and provide custom `/conf/gremlin-server/gremlin-server.yaml`
