# Copyright 2015 Marcin Nowicki
# Distributed under the terms of the MIT License

inherit git-r3

EAPI=5

DESCRIPTION="Inter Planetary File System - Go implementation"
HOMEPAGE="https://github.com/ipfs/go-ipfs"

EGIT_REPO_URI="git://github.com:ipfs/go-ipfs.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="fuse"

DEPEND="
  >=dev-lang/go-1.4
  fuse? ( >=sys-fs/fuse-2.9 )
"
RDEPEND=""
