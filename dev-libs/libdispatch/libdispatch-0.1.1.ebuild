# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit cmake-multilib

DESCRIPTION="Linux port of Apple's open-source concurrency library"
HOMEPAGE="http://nickhutchinson.me/libdispatch"
SRC_URI="https://github.com/nickhutchinson/libdispatch/archive/v0.1.1.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=sys-devel/clang-3.4"
RDEPEND="${DEPEND}
	dev-libs/libblocksruntime[${MULTILIB_USEDEP}]
	dev-libs/libpthread_workqueue[${MULTILIB_USEDEP}]
	dev-libs/libkqueue[${MULTILIB_USEDEP}]"

src_unpack() {
	unpack ${A}
	sed -i 's/DESTINATION lib/DESTINATION ${CMAKE_INSTALL_LIBDIR}/' "${PF}/src/CMakeLists.txt"
	cd "${S}"
}

src_configure() {
	export CC=clang
	export CXX=clang++

	append-flags -fblocks

	local mycmakeargs="-DDISPATCH_INCLUDE_DIR=include"
	cmake-multilib_src_configure
}

src_install() {
	cmake-multilib_src_install

	#insinto /usr/include/dispatch
	#doins "${FILESDIR}/dispatch.h"
	#dosym dispatch/dispatch.h /usr/include/dispatch/dispatch.h
}
