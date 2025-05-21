#/bin/sh -e
if [ $(id -u) -ne 0 ]; then
    echo >&2 "You must install as root."
    exit 1
fi

src=$(dirname "$(realpath "$0")")
usr=${prefix:-/usr/local}

mkdir -p "$DESTDIR/etc/dkms/template-dkms-mkbmdeb"
mkdir -p "$DESTDIR$usr/bin"
mkdir -p "$DESTDIR$usr/share/man/man8"

cp -fr "$src/template/"* "$DESTDIR/etc/dkms/template-dkms-mkbmdeb/"

install "$src/dkms-mkbmdeb" "$DESTDIR$usr/bin/"
cp -f "$src/dkms-mkbmdeb.8" "$DESTDIR$usr/share/man/man8/"
mandb -q

echo "dkms-mkbmdeb has been installed to $usr."
