FROM nikolaik/python-nodejs:python3.12-nodejs23-slim

# Install required dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
  git \
  jq \
  make \
  && rm -rf /var/lib/apt/lists/*

# Copy project files
COPY Makefile requirements.txt ./

# Build project
RUN make build
