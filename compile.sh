#!/bin/bash

# Clean all auxiliary files to force fresh compilation
echo "Cleaning auxiliary files..."
rm -f main.aux main.bbl main.bcf main.blg main.run.xml main.out main.toc main.log main.fls main.fdb_latexmk

# Clear biber cache
echo "Clearing biber cache..."
biber --cache

# First pass: xelatex
echo "Running xelatex (pass 1)..."
xelatex -interaction=nonstopmode main.tex

# Run biber to process bibliography
echo "Running biber..."
biber main

# Second pass: xelatex
echo "Running xelatex (pass 2)..."
xelatex -interaction=nonstopmode main.tex

# Third pass: xelatex (to resolve all references)
echo "Running xelatex (pass 3)..."
xelatex -interaction=nonstopmode main.tex

echo "Done! Check main.pdf"
