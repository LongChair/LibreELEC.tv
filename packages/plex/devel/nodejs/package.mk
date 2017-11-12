################################################################################
#      This file is part of OpenELEC - http://www.openelec.tv
#      Copyright (C) 2009-2014 Stephan Raue (stephan@openelec.tv)
#
#  OpenELEC is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 2 of the License, or
#  (at your option) any later version.
#
#  OpenELEC is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with OpenELEC.  If not, see <http://www.gnu.org/licenses/>.
################################################################################

PKG_NAME="nodejs"
PKG_VERSION="8.8.1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_URL="https://github.com/nodejs/node/archive/v$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="node-$PKG_VERSION"
PKG_DEPENDS_TARGET="toolchain gmp"
PKG_DEPENDS_HOST="icu:host"
PKG_PRIORITY="optional"
PKG_SECTION="devel"
PKG_SHORTDESC="Node.js is a JavaScript runtime built on Chrome's V8 JavaScript engine"
PKG_LONGDESC="Node.js is a JavaScript runtime built on Chrome's V8 JavaScript engine"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

pre_configure_host() {
  mkdir -p $PKG_BUILD/.$HOST_NAME
  cp -a $PKG_BUILD/* $PKG_BUILD/.$HOST_NAME/
}

configure_host() {
  cd $PKG_BUILD/.$HOST_NAME
  ./configure --prefix=$TOOLCHAIN --with-intl=none
}
