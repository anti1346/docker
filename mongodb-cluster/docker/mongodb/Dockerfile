FROM mongo:4.4.6

# Generate keyfile
RUN mkdir -p /data/key \
  && openssl rand -base64 756 > /data/key/replica-set.key

# Modify keyfile permissions
RUN chown mongodb:mongodb /data/key/replica-set.key \
  && chmod 400 /data/key/replica-set.key

