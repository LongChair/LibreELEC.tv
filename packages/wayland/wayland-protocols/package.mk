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

PKG_NAME="wayland-protocols"
PKG_VERSION="1.11"
PKG_SHA256="3afcee1d51c5b1d70b59da790c9830b354236324b19b2b7af9683bd3b7be6804"
PKG_ARCH="any"
PKG_LICENSE="OSS"
PKG_SITE="http://wayland.freedesktop.org/"
PKG_URL="http://wayland.freedesktop.org/releases/${PKG_NAME}-${PKG_VERSION}.tar.xz"
PKG_DEPENDS_TARGET="toolchain"
PKG_SECTION="wayland"
PKG_SHORTDESC="Specifications of extended Wayland protocols"
PKG_LONGDESC="Specifications of extended Wayland protocols"
PKG_AUTORECONF="yes"

pre_makeinstall_target() {
  sed "s|prefix=/usr|prefix=$SYSROOT_PREFIX/usr|" -i wayland-protocols.pc
}

post_makeinstall_target() {
  rm -rf $INSTALL
}
