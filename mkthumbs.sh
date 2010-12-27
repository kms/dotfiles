#!/bin/sh

mkdir thumbs-small
mkdir thumbs-large

mogrify -define jpeg:size=640x480 -thumbnail 640x480 -unsharp 0x.5 \
-auto-orient -path thumbs-small -quality 85 -verbose 'IMG_????.JPG'

mogrify -thumbnail 1920x1280 -auto-orient -path thumbs-large -quality 95 \
-verbose 'IMG_????.JPG'
