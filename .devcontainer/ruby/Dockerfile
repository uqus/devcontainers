FROM ruby:latest

ENV EDITOR=nano \
    TZ=Europe/Moscow \
    INSTALL_PATH=/app \
    BUNDLE_PATH=/opt/bundle

RUN apt-get update -qq \
    && apt-get install --no-install-recommends -y build-essential nano mc postgresql-client libvips \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists /var/cache/apt/archives

RUN gem update --system \
    # && gem install foreman \
    && mkdir $INSTALL_PATH $BUNDLE_PATH


RUN groupadd --system --gid 1000 rails && \
    useradd rails --uid 1000 --gid 1000 --create-home --shell /bin/bash && \
    chown -R rails:rails $INSTALL_PATH $BUNDLE_PATH

USER rails:rails

COPY --chown=rails:rails mc.ini /home/rails/.config/mc/ini

COPY --chown=rails:rails bash_aliases /home/rails/.bash_aliases

RUN echo 'IRB.conf[:USE_AUTOCOMPLETE] = false' > ~/.irbrc && \
    echo '[ -f ~/.rc ] && . ~/.rc' >> ~/.bashrc

WORKDIR $INSTALL_PATH