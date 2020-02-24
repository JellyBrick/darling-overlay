# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit git-r3 cmake-utils

DESCRIPTION="Darling is a translation layer that lets you run macOS software on Linux"
HOMEPAGE="https://www.darlinghq.org/"
SRC_URI=""

EGIT_REPO_URI="https://github.com/darlinghq/darling.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
	>=sys-devel/clang-7.0.1
	virtual/udev
	gnustep-base/gnustep-base
	gnustep-base/gnustep-corebase
	gnustep-base/gnustep-gui"
RDEPEND="
	virtual/udev
	gnustep-base/gnustep-base
	gnustep-base/gnustep-corebase
	gnustep-base/gnustep-gui
	dev-libs/libkqueue
	dev-libs/libdispatch
	dev-libs/openssl
	>=dev-libs/libbsd-0.5.2
	!libav? ( media-video/ffmpeg:0= )
	libav? ( >=media-video/libav-11:0= )"

src_configure() {
	local mycmakeargs=();
	export CC=clang
	export CXX=clang++

	# TODO: multilib
	if use amd64; then
		local mycmakeargs+=("-DSUFFIX=64")
	fi

	cmake-utils_src_configure
}

