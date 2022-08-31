FROM rust:alpine

# Install build dependencies
RUN apk --no-cache add git musl-dev

# Download zowex source from GitHub
RUN git clone --depth 1 https://github.com/zowe/zowe-cli.git

# Build zowex binary
RUN cd zowe-cli/zowex && cargo build --verbose --release


FROM alpine:latest

# Install runtime dependencies
RUN apk --no-cache add nodejs npm

# Install Zowe CLI
RUN npm install -g @zowe/cli --ignore-scripts && npm cache clean --force && \
  rm -rf /usr/local/lib/node_modules/@zowe/cli/prebuilds

# Copy zowex binary
COPY --from=0 /zowe-cli/zowex/target/release/zowe /usr/local/sbin/zowe

# Disable credential manager
RUN mkdir -p /root/.zowe/settings && \
  echo "{\"overrides\":{\"CredentialManager\":false}}" >> /root/.zowe/settings/imperative.json

# Launch zowe daemon
CMD nohup /usr/local/bin/zowe --daemon > /dev/null & /bin/sh