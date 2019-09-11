# alpine custom

Added ping, dig, less, nano, and bash.

## Version / Tags

3.10.3, 3.10, 3, latest
- added wget, curl

3.10.2
- added busybox-extras (telnet)
- first version (bash, ping, telnet, nano, less, dig)

## Building log

```bash
$ make build-alpine

alpine-baselayout-3.1.2-r0 - Alpine base dir structure and init scripts
alpine-keys-2.1-r2 - Public keys for Alpine Linux packages
apk-tools-2.10.4-r2 - Alpine Package Keeper - package manager for alpine
bash-5.0.0-r0 - The GNU Bourne Again shell
bind-libs-9.14.3-r0 - The ISC DNS server (libraries)
bind-tools-9.14.3-r0 - The ISC DNS tools
busybox-1.30.1-r2 - Size optimized toolbox of many common UNIX utilities
busybox-extras-1.30.1-r2 - Additional binaries of Busybox
byobu-5.129-r0 - An enhancement of the GNU Screen
ca-certificates-20190108-r0 - Common CA certificates PEM files
ca-certificates-cacert-20190108-r0 - Mozilla bundled certificates
curl-7.65.1-r0 - URL retrival utility and library
expat-2.2.7-r0 - An XML Parser library written in C
fstrm-0.5.0-r0 - Frame Streams implementation in C
gdbm-1.13-r1 - GNU dbm is a set of database routines that use extensible hashing
htop-2.2.0-r0 - Interactive process viewer
iputils-20180629-r1 - IP Configuration Utilities (and Ping)
jq-1.6-r0 - A lightweight and flexible command-line JSON processor
json-c-0.13.1-r0 - A JSON implementation in C
keyutils-libs-1.6-r1 - Key utilities library
krb5-conf-1.0-r1 - Shared krb5.conf for both MIT krb5 and heimdal
krb5-libs-1.17-r0 - The shared libraries used by Kerberos 5
less-551-r0 - File pager
libbz2-1.0.6-r7 - Shared library for bz2
libc-utils-0.7.1-r0 - Meta package to pull in correct libc
libcap-2.27-r0 - POSIX 1003.1e capabilities
libcom_err-1.45.2-r0 - Common error description library
libcrypto1.1-1.1.1c-r0 - Crypto library from openssl
libcurl-7.65.1-r0 - The multiprotocol file transfer library
libevent-2.1.10-r0 - An event notification library
libffi-3.2.1-r6 - A portable, high level programming interface to various calling conventions.
libgcc-8.3.0-r0 - GNU C compiler runtime libraries
libmagic-5.37-r0 - File type identification library
libssl1.1-1.1.1c-r0 - SSL shared libraries
libstdc++-8.3.0-r0 - GNU C++ standard runtime library
libtls-standalone-2.9.1-r0 - libtls extricated from libressl sources
libverto-0.3.1-r0 - Main loop abstraction library
libxml2-2.9.9-r2 - XML parsing library, version 2
lsof-4.91-r0 - LiSt Open Files
musl-1.1.22-r3 - the musl c library (libc) implementation
musl-utils-1.1.22-r3 - the musl c library (libc) implementation
nano-4.3-r0 - Enhanced clone of the Pico text editor
ncurses-libs-6.1_p20190518-r0 - Ncurses libraries
ncurses-terminfo-6.1_p20190518-r0 - Console display library (other terminfo files)
ncurses-terminfo-base-6.1_p20190518-r0 - Descriptions of common terminals
nghttp2-libs-1.39.2-r0 - Experimental HTTP/2 client, server and proxy (libraries)
oniguruma-6.9.2-r0 - a regular expressions library
protobuf-3.6.1-r1 - Library for extensible, efficient structure packing
protobuf-c-1.3.0-r6 - C bindings for Google's Protocol Buffers
python3-3.7.3-r0 - A high-level scripting language
readline-8.0.0-r0 - GNU readline library
scanelf-1.2.3-r0 - Scan ELF binaries for stuff
sqlite-libs-3.28.0-r0 - Sqlite3 library
ssl_client-1.30.1-r2 - EXternal ssl_client for busybox wget
tmux-2.9a-r0 - Tool to control multiple terminals from a single terminal
wget-1.20.3-r0 - A network utility to retrieve files from the Web
xz-libs-5.2.4-r0 - Library and CLI tools for XZ and LZMA compressed files (libraries)
zlib-1.2.11-r1 - A compression/decompression Library
```

