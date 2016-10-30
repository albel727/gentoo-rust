# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

inherit eutils bash-completion-r1

DESCRIPTION="Systems programming language from Mozilla (sources)"
HOMEPAGE="http://www.rust-lang.org/"
MY_SRC_URI="http://static.rust-lang.org/dist/rust-src-nightly.tar.gz"

LICENSE="|| ( MIT Apache-2.0 ) BSD-1 BSD-2 BSD-4 UoI-NCSA"
SLOT="nightly"
KEYWORDS="amd64"

CDEPEND="
"
DEPEND="${CDEPEND}
	net-misc/wget
"
RDEPEND="${CDEPEND}
"

RESTRICT="strip"

src_unpack() {
	wget "${MY_SRC_URI}" || die
	unpack ./"rust-src-nightly.tar.gz"

	mv "${WORKDIR}/rust-src-nightly" "${S}" || die
}

src_install() {
    dodir "/usr/local/src/"
    mv "${S}/rust-src/lib/rustlib/src/rust/" "${D}/usr/local/src/rustc-nightly"
}
