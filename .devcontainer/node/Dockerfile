FROM node:latest

ENV EDITOR=nano \
    INSTALL_PATH=/app \
    MODULES_PATH=/app/node_modules

RUN apt-get update -qq \
    && apt-get install --no-install-recommends -y curl wget nano mc htop \
    && apt-get clean  \
    && rm -rf /var/lib/apt/lists /var/cache/apt/archives

RUN npm install -g npm@latest

RUN mkdir $INSTALL_PATH $MODULES_PATH \
    && chown -R node:node $INSTALL_PATH $MODULES_PATH

USER node:node

COPY --chown=node:node mc.ini /home/node/.config/mc/ini

RUN echo 'include "/usr/share/nano/*.nanorc"' > ~/.nanorc

WORKDIR $INSTALL_PATH
