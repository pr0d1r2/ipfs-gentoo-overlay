# Gentoo overlay with IPFS (Inter Planetary File System)

See: http://ipfs.io

## Usage

* Add overlay to list in `/etc/layman/layman.cfg`:
```
overlays  : http://www.gentoo.org/proj/en/overlays/repositories.xml
            https://raw.githubusercontent.com/pr0d1r2/ipfs-gentoo-overlay/master/repositories.xml
```
* Sync layman remote list:
```
layman -S
```
* Add overlay to layman:
```
layman -a ipfs
```
* Then emerge:
```
USE="fuse" ACCEPT_KEYWORDS="~amd64" emerge -av go-ipfs
```

## WIP

This is work in progress. See: https://github.com/pr0d1r2/ipfs-gentoo-overlay/issues
