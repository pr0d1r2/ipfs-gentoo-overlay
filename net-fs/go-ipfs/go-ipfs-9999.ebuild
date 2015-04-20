# Copyright 2015 Marcin Nowicki
# Distributed under the terms of the MIT License

EAPI=5
inherit eutils git-r3

DESCRIPTION="Inter Planetary File System - Go implementation"
HOMEPAGE="https://github.com/ipfs/go-ipfs"

EGIT_REPO_URI="https://github.com/ipfs/go-ipfs.git"
EGIT_BRANCH="master"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="fuse"

DEPEND="
  >=dev-lang/go-1.4
  fuse? ( >=sys-fs/fuse-2.9 )
"
RDEPEND=""
