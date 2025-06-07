#!/bin/bash

if [ -f "package.json" ]; then
    echo "Found package.json, running npm commands..."

    npm install
    npm run dev
else
    echo "No package.json found in `pwd`, skipping npm commands."

    bash
fi
