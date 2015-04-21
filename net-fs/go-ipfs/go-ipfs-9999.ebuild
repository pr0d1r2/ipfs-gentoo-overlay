# Copyright 2015 Marcin Nowicki
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit git-r3

RESTRICT="strip"

DESCRIPTION="Inter Planetary File System - Go implementation"
HOMEPAGE="https://github.com/ipfs/go-ipfs"
EGIT_REPO_URI="https://github.com/ipfs/go-ipfs.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
  >=dev-lang/go-1.4
  dev-libs/go-fuse-bazil
  sys-apps/daemonize
"
RDEPEND=""

GO_PN="github.com/ipfs/go-ipfs"
EGIT_CHECKOUT_DIR="${S}/src/${GO_PN}"

export GOPATH="${S}"

src_compile() {
#no examples right now
#    example/hello example/loopback example/zipfs \
#    example/multizip example/unionfs example/memfs \
#    example/autounionfs ; \
#or tests
#fuse/test
#for d in fuse fuse/pathfs zipfs unionfs
#do
    #go build -v -x -work ${GO_PN}/${d} || die
#done
#    go build -v -x -work ${GO_PN} || die
for d in cmd/ipfs
do
    go build -v -x -work ${GO_PN}/${d} || die
done
}

src_install() {
#for d in fuse fuse/pathfs zipfs unionfs
#do
    #go install -v -x -work ${GO_PN}/${d} || die
#done
#    go install -v -x -work ${GO_PN} || die
for d in cmd/ipfs
do
    go install -v -x -work ${GO_PN}/${d} || die
done

insinto /usr/lib/go/
dobin "bin/ipfs"
doins -r "${S}/pkg"
insinto "/usr/lib/go/src/pkg/${GO_PN}/"
#for this ebuild, to fix bug #503324 I have limited what is installed
#another possible solution would have been using adddeny to the
#hide installed filed during build
rm -r "${S}/src/${GO_PN}/.git"
#doins -r "${S}/src/${GO_PN}/fuse"
#doins -r "${S}/src/${GO_PN}/splice"
doins -r "${S}/src/${GO_PN}"

dodir /ipfs
dodir /ipns
doinitd ${FILESDIR}/init.d/ipfs-daemon
doinitd ${FILESDIR}/init.d/ipfs-mount
}
