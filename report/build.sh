#!/bin/bash

set ex

export RUN=

make syncs3

make report.pdf

mv report.pdf /output/"$(date +'%Y-%m-%d') CSM Methods".pdf

