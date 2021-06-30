#!/bin/bash

set ex

export RUN=

make syncs3

make report.pdf

make files.zip

mv report.pdf /output/"$(date +'%Y-%m-%d') CSM Methods".pdf
mv files.zip /output/"$(date +'%Y-%m-%d') CSM Methods Files".zip

