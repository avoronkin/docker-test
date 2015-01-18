FROM ubuntu:14.10

# Base install
RUN apt-get update -y
RUN apt-get install -y git-core curl

# Install NVM
RUN git clone https://github.com/creationix/nvm.git /.nvm
RUN echo ". /.nvm/nvm.sh" >> /etc/bash.bashrc

ENV NODE_VERSION "v0.10.18"

# Install node.js
RUN /bin/bash -c ". /.nvm/nvm.sh && \
  nvm install $NODE_VERSION && \
  nvm use $NODE_VERSION && \
  nvm alias default $NODE_VERSION && \
  ln -s /.nvm/$NODE_VERSION/bin/node /usr/bin/node && \
  ln -s /.nvm/$NODE_VERSION/bin/npm /usr/bin/npm"

EXPOSE 3000

WORKDIR /src
