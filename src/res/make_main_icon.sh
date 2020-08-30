#!/bin/bash
convert +antialias -background none -density 1024 lc.png -define icon:auto-resize lc.ico
convert +antialias -background none -resize 256x256 lc.png lc.xpm
sed -i -E 's/^static char \*lc\[\] = \{$/static const char *c4x_xpm[] = {/' lc.xpm

mkdir -p icns_src
pushd icns_src
for resolution in 16 32 48 128 256 512 1024; do
	convert -resize ${resolution}x${resolution} ../lc.png lc_$resolution.png
done
png2icns ../lc.icns *.png
popd
rm -r icns_src
