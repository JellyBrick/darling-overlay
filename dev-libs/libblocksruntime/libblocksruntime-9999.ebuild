# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=7

inherit autotools git-r3

DESCRIPTION="This source tree is based on the BlocksRuntime directory of the compiler-rt sources"
HOMEPAGE="https://github.com/mheily/blocks-runtime"
SRC_URI=""

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

EGIT_REPO_URI="https://github.com/mheily/blocks-runtime.git"

DEPEND=""
RDEPEND="${DEPEND}"

src_unpack() {
	git-2_src_unpack
}

src_prepare() {
	eautoreconf
}

src_configure() {
	econf
}

src_compile() {
	emake
}

src_install() {
	emake DESTDIR="${D}" install
}
