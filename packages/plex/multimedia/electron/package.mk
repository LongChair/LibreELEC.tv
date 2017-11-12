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

PKG_NAME="electron"
PKG_VERSION="1.6.15"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_URL="https://github.com/electron/electron/archive/v$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain Python gtk+ libchromiumcontent"
PKG_PRIORITY="optional"
PKG_SECTION="multimedia"
PKG_SHORTDESC="electron
PKG_LONGDESC="

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

unpack() {
  mkdir $BUILD/${PKG_NAME}-${PKG_VERSION}

  git clone -b upgrade-to-chromium-61 https://github.com/electron/electron  $BUILD/${PKG_NAME}-${PKG_VERSION}/.
}

configure_target() {
  #update git contents
  cd $BUILD/${PKG_NAME}-${PKG_VERSION}
  export LIBCHROMIUMCONTENT_MIRROR="file:///home/longchair/libchromiumcontent"
  export PKG_CONFIG_PATH="$SYSROOT_PREFIX/usr/lib/pkgconfig;$SYSROOT_PREFIX/usr/share/pkgconfig"
  echo "!!!!!! PKG_CONFIG_PATH=$PKG_CONFIG_PATH"
  ./script/bootstrap.py -v --target_arch=arm64
  #git submodule sync --recursive
  #git submodule update --init --recursive

  # update nodejs packages
  #npm install

  # run gyp
  #vendor/gyp/gyp_main.py -f ninja --depth . electron.gyp  -Icommon.gypi -Dlibchromiumcontent_component=0 -Dtarget_arch=arm64 -Dhost_arch=x64 -Dlibrary=static_library 

}

make_target() {
   ./script/build.py
}

makeinstall_target() {
  echo "install"
}


