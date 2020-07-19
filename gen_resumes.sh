#!/bin/bash

THEMES=(macchiato onepage spartan stackoverflow)
HTML_DIR=themes
PDF_DIR=pdf

# Generate resumes
echo "$0"

for theme in ${THEMES[*]}
do
   echo "$theme"
   resume export "$HTML_DIR/resume-$theme.html" --theme $theme
   echo ""
done

# Generate macchiato pdf
# https://www.npmjs.com/package/jsonresume-theme-macchiato
puppeteer --margin-top 0 --margin-right 0 --margin-bottom 0 --margin-left 0 --format A4 \
    print "$HTML_DIR/resume-macchiato.html" "$PDF_DIR/resume-macchiato.pdf"

echo "finished generating resumes"