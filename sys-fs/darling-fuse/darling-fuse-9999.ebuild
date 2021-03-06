# Copyright 1999-2020 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7

inherit git-r3 cmake-utils

DESCRIPTION="Readonly access to .dmg files with HFS+ filesystem via FUSE"
HOMEPAGE="http://darlinghq.org"
SRC_URI=""

EGIT_REPO_URI="https://github.com/darlinghq/darling-dmg"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="sys-fs/fuse
	sys-libs/zlib
	app-arch/bzip2
	dev-libs/openssl
	dev-libs/libxml2
	dev-libs/icu"
RDEPEND="${DEPEND}"

src_unpack() {
	git-r3_src_unpack
}

src_configure() {
	cmake-utils_src_configure
}

