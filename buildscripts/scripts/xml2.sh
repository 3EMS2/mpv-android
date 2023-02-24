#!/bin/bash -e

. ../../include/path.sh

if [ "$1" == "build" ]; then
	true
elif [ "$1" == "clean" ]; then
	rm -rf _build$ndk_suffix
	exit 0
else
	exit 255
fi

[ -f configure ] || ./autogen.sh

mkdir -p _build$ndk_suffix
cd _build$ndk_suffix

../configure \
	--target=$ndk_triple --host=$ndk_triple --with-pic \
	--enable-static --disable-shared \
	--without-python \
	--without-zlib \
	--without-lzma \
	--without-xpath \
	--without-schemas \
	--without-schematron \
	--without-xptr \
	--without-xinclude \
	--without-c14n \
	--without-xptr-locs \
	--without-http

make -j$cores
make DESTDIR="$prefix_dir" install
