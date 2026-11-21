#!/bin/sh
set -eu
project=$(CDPATH='' cd -- "$(dirname -- "$0")/.." && pwd)
destination=${1:-"$project/dist"}
mkdir -p "$destination"
staging=$(mktemp -d)
trap 'rm -rf "$staging"' EXIT
version=1.0.0
name=agenda-personal
install -d "$staging/DEBIAN" "$staging/usr/share/$name/web" "$staging/usr/share/$name/desktop" "$staging/usr/bin"
cat > "$staging/DEBIAN/control" <<CONTROL
Package: $name
Version: $version
Section: office
Priority: optional
Architecture: all
Maintainer: Agenda project <ag-hp@users.noreply.github.com>
Depends: python3, python3-gi, gir1.2-gtk-3.0, gir1.2-webkit2-4.1
Description: Agenda personal con calendario, tareas y notas
 Aplicación de escritorio con almacenamiento local.
CONTROL
cp -R "$project/web/." "$staging/usr/share/$name/web/"
install -m 755 "$project/desktop/agenda.py" "$staging/usr/share/$name/desktop/agenda.py"
ln -s "../share/$name/desktop/agenda.py" "$staging/usr/bin/agenda"
install -Dm 644 "$project/desktop/agenda.desktop" "$staging/usr/share/applications/com.agenda.personal.desktop"
install -Dm 644 "$project/web/icons/agenda-512.png" "$staging/usr/share/icons/hicolor/512x512/apps/com.agenda.personal.png"
dpkg-deb --root-owner-group --build "$staging" "$destination/${name}_${version}_all.deb"
