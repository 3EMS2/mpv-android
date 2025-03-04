#!/bin/bash -e

. ./include/depinfo.sh

[ -z "$TRAVIS" ] && TRAVIS=0
[ -z "$WGET" ] && WGET=wget

mkdir -p deps && cd deps

# mbedtls
if [ ! -d mbedtls ]; then
	mkdir mbedtls
	$WGET https://github.com/ARMmbed/mbedtls/archive/mbedtls-$v_mbedtls.tar.gz -O - | \
		tar -xz -C mbedtls --strip-components=1
fi

# libxml2
if [ ! -d xml2 ]; then
	mkdir xml2
	$WGET https://download.gnome.org/sources/libxml2/2.10/libxml2-2.10.3.tar.xz -O - | \
		tar -xJ -C xml2 --strip-components=1
fi

# ovvc
[ ! -d ovvc ] && git clone -b 3ems2 https://github.com/3EMS2/OpenVVC ovvc

# dav1d
[ ! -d dav1d ] && git clone https://code.videolan.org/videolan/dav1d.git

# ffmpeg
[ ! -d ffmpeg ] && git clone -b 3ems2 https://github.com/3EMS2/FFmpeg ffmpeg

# freetype2
[ ! -d freetype2 ] && git clone git://git.sv.nongnu.org/freetype/freetype2.git -b VER-$v_freetype

# fribidi
if [ ! -d fribidi ]; then
	mkdir fribidi
	$WGET https://github.com/fribidi/fribidi/releases/download/v$v_fribidi/fribidi-$v_fribidi.tar.xz -O - | \
		tar -xJ -C fribidi --strip-components=1
fi

# harfbuzz
if [ ! -d harfbuzz ]; then
	mkdir harfbuzz
	$WGET https://github.com/harfbuzz/harfbuzz/releases/download/$v_harfbuzz/harfbuzz-$v_harfbuzz.tar.xz -O - | \
		tar -xJ -C harfbuzz --strip-components=1
fi

# libass
[ ! -d libass ] && git clone https://github.com/libass/libass

# lua
if [ ! -d lua ]; then
	mkdir lua
	$WGET http://www.lua.org/ftp/lua-$v_lua.tar.gz -O - | \
		tar -xz -C lua --strip-components=1
fi

# mpv
[ ! -d mpv ] && git clone https://github.com/mpv-player/mpv

cd ..
