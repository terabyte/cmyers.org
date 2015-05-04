#!/bin/bash

set -e

cd resume && pdflatex resume.tex 2>&1 >/dev/null

