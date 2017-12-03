################################################################################
#      This file is part of LibreELEC - https://libreelec.tv
#      Copyright (C) 2016-present Team LibreELEC
#
#  LibreELEC is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 2 of the License, or
#  (at your option) any later version.
#
#  LibreELEC is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with LibreELEC.  If not, see <http://www.gnu.org/licenses/>.
################################################################################

PKG_NAME="cairo-weston"
PKG_VERSION="1.14.10"
PKG_SHA256="7e87878658f2c9951a14fc64114d4958c0e65ac47530b8ac3078b2ce41b66a09"
PKG_ARCH="any"
PKG_LICENSE="LGPL"
PKG_SITE="http://cairographics.org/"
PKG_URL="http://cairographics.org/releases/cairo-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain zlib freetype fontconfig libpng pixman"
PKG_SOURCE_DIR="cairo-$PKG_VERSION"
PKG_SECTION="graphics"
PKG_SHORTDESC="cairo: Multi-platform 2D graphics library"
PKG_LONGDESC="Cairo is a vector graphics library with cross-device output support. Currently supported output targets include the X Window System and in-memory image buffers. PostScript and PDF file output is planned. Cairo is designed to produce identical output on all output media while taking advantage of display hardware acceleration when available."
PKG_AUTORECONF="yes"

if [ "$OPENGL" != "no" ]; then
  PKG_DEPENDS_TARGET+=" $OPENGL"
fi

if [ "$OPENGLES" != "no" ]; then
  PKG_DEPENDS_TARGET+=" $OPENGLES"
fi

PKG_CONFIGURE_OPTS_TARGET=" \
            --disable-silent-rules \
            --enable-shared \
            --disable-static \
            --disable-gtk-doc \
            --enable-largefile \
            --enable-atomic \
            --enable-glesv2 \
            --enable-png \
            --enable-egl \
            --enable-ft \
            --enable-fc \
            --enable-ps \
            --enable-pdf \
            --enable-svg \
            --disable-xml \
            --enable-pthread \
            --enable-interpreter \
            --disable-symbol-lookup \
            --enable-some-floating-point \
            --with-gnu-ld \
            --without-x"
