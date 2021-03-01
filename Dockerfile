# The official Elasticsearch Docker image
FROM docker.elastic.co/elasticsearch/elasticsearch:6.4.0@sha256:2244676001fa9b12012ec1f7a51526a8d7384fcb02674e5ae29b6e637e363908

# Copy our config file over
COPY --chown=1000:0 config/elasticsearch.yml /usr/share/elasticsearch/config/elasticsearch.yml

# Allow Elasticsearch to create `elasticsearch.keystore`
# to circumvent https://github.com/elastic/ansible-elasticsearch/issues/430
RUN chmod g+ws /usr/share/elasticsearch/config

USER 1000:0
