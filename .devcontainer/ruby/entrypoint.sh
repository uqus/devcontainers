#!/bin/bash

if [ -f "Gemfile.lock" ]; then
    echo "Found Gemfile.lock, running bundle commands..."
    bundle install

    if [ -f "config/application.rb" ]; then
        echo "Rails application detected, continue..."

        rm -f tmp/pids/server.pid

        bundle exec rails db:prepare
        bundle exec rails s -b 0.0.0.0
    else
        echo "Rails application not found in `pwd`"

        bash
    fi
else
    echo "No Gemfile.lock found in `pwd`, skipping bundle commands."

    bash
fi
