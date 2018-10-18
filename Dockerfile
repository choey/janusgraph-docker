FROM openjdk:8-slim

ENV JANUS_VERSION 0.3.1
ENV VARIANT hadoop2
ENV ARTIFACT_NAME janusgraph-${JANUS_VERSION}-${VARIANT}
ENV ZIP_FILENAME ${ARTIFACT_NAME}.zip
ENV TARGET_DIR /usr/lib/janusgraph

RUN mkdir -p ${TARGET_DIR}
WORKDIR ${TARGET_DIR}
ADD https://github.com/JanusGraph/janusgraph/releases/download/v${JANUS_VERSION}/${ZIP_FILENAME} .
# this is useful for local builds if the zip file is downloaded next to this Dockerfile
# ADD ${ZIP_FILENAME} .
RUN unzip ${ZIP_FILENAME} > /dev/null && \ 
	rm ${ZIP_FILENAME} && \
	mv ${ARTIFACT_NAME}/* . && \
	rm -rf ${ARTIFACT_NAME} && \
	rm -rf javadocs && \
	rm -rf examples

# to change config, edit /usr/bin/janusgraph/conf/gremlin-server/gremlin-server.yaml
# other config examples are under /usr/bin/janusgraph/conf/...
ENTRYPOINT [ "/usr/lib/janusgraph/bin/gremlin-server.sh" ]