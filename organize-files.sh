#!/bin/bash

# Define directories
CSS_DIR="css"
JS_DIR="js"
IMG_DIR="img"
FONTS_DIR="fonts"

# Create directories if not exist
mkdir -p $CSS_DIR $JS_DIR $IMG_DIR $FONTS_DIR

# Move CSS files
mv *.css $CSS_DIR/

# Move JavaScript files
mv *.js $JS_DIR/

# Move image files (you can add more extensions as needed)
mv *.{png,jpg,jpeg,gif,svg} $IMG_DIR/

# Move font files (you can add more extensions as needed)
mv *.{woff,woff2,ttf,eot,otf} $FONTS_DIR/

# Update HTML file references
for file in *.html
do
    sed -i 's/\(src=\"\)\([^\"]*\.css\)/\1$CSS_DIR\/\2/g' "$file"
    sed -i 's/\(src=\"\)\([^\"]*\.js\)/\1$JS_DIR\/\2/g' "$file"
    sed -i 's/\(src=\"\)\([^\"]*\.png\)/\1$IMG_DIR\/\2/g' "$file"
    sed -i 's/\(src=\"\)\([^\"]*\.[jpe]?g\)/\1$IMG_DIR\/\2/g' "$file"
    sed -i 's/\(src=\"\)\([^\"]*\.gif\)/\1$IMG_DIR\/\2/g' "$file"
    sed -i 's/\(src=\"\)\([^\"]*\.svg\)/\1$IMG_DIR\/\2/g' "$file"
    sed -i 's/\(src=\"\)\([^\"]*\.[wo]?off[2]?\)/\1$FONTS_DIR\/\2/g' "$file"
    sed -i 's/\(src=\"\)\([^\"]*\.[tT][tF]|[eE][oO][tT]|[oO][tT][fF]\)/\1$FONTS_DIR\/\2/g' "$file"
done
