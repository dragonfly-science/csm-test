#!/bin/bash

set ex

make report.pdf

mv report.pdf /output/"$(date +'%Y-%m-%d') CSM Methods".pdf

