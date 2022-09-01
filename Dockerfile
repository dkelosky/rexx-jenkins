# image to build zowe native binary
FROM rust:alpine

# Install build dependencies
RUN apk --no-cache add git musl-dev

# Download zowex source from GitHub
RUN git clone --depth 1 https://github.com/zowe/zowe-cli.git

# Build zowex binary
RUN cd zowe-cli/zowex && cargo build --verbose --release

#
# Next image
#

# lightweight image
FROM alpine:latest

# Install runtime dependencies
RUN apk --no-cache add nodejs npm bash

# Install Zowe CLI
RUN npm install -g @zowe/cli --ignore-scripts && npm cache clean --force && \
  rm -rf /usr/local/lib/node_modules/@zowe/cli/prebuilds

# Copy zowex binary from previous image
COPY --from=0 /zowe-cli/zowex/target/release/zowe /usr/local/sbin/zowe

# Add Zowe user and update password (using alipine syntax)
# https://github.com/awharn/zowe-cli-sample-dockerfiles
RUN adduser zowe --shell /bin/bash -D && echo 'zowe:zowe' | chpasswd
RUN echo "cd ~" >> /home/zowe/.bashrc

USER zowe

# Disable credential manager
RUN mkdir -p /home/zowe/.zowe/settings && \
  echo "{\"overrides\":{\"CredentialManager\":false}}" >> /home/zowe/.zowe/settings/imperative.json
