# Agenda 2026 · 2027

Agenda personal con calendario, tareas, eventos y un editor de notas con dibujo, texto, plantillas y notas adhesivas. Las tres versiones comparten la interfaz de `web/`. Cada instalación guarda sus propios datos en el dispositivo.

## Web

Para probarla en el ordenador, ejecuta `python3 -m http.server 8000 --directory web` y abre [http://localhost:8000](http://localhost:8000).

Para publicarla gratis con HTTPS desde un repositorio público de GitHub, selecciona «GitHub Actions» en «Settings → Pages → Build and deployment → Source». El flujo «Publicar Agenda en GitHub Pages» publica el contenido de `web/` al cambiar esa carpeta en `main`. También puedes iniciar el primer despliegue desde la pestaña «Actions». La agenda del repositorio `ag-hp/agenda` está en [GitHub Pages](https://ag-hp.github.io/agenda/prueba-cuentas.html).

Después de la primera visita con conexión, la agenda puede abrirse sin conexión. Las fuentes externas pueden usar sus alternativas del sistema.

También se puede instalar como aplicación web desde un navegador de escritorio compatible o desde Safari en iPhone y iPad con «Compartir → Añadir a pantalla de inicio».

## Escritorio para Linux

El instalador `.deb` está dirigido a Linux Mint, Ubuntu y sistemas Debian compatibles que ofrezcan GTK 3 y WebKitGTK 4.1. Abre el paquete con el gestor de software o ejecuta:

```sh
sudo apt install ./agenda-personal_1.0.0_all.deb
```

Abre «Agenda» desde el menú de aplicaciones. Para generar el paquete desde el código, ejecuta `./desktop/build-deb.sh`. El resultado queda en `dist/`.

## App para iPhone y iPad

Abre `ios/Agenda.xcodeproj` en Xcode. El proyecto incluye la web en el paquete y utiliza SwiftUI y WebKit. Es compatible con iOS y iPadOS 16 o posterior. Para compilar sin firma para el simulador:

```sh
xcodebuild -project ios/Agenda.xcodeproj -target Agenda -configuration Debug -sdk iphonesimulator CODE_SIGNING_ALLOWED=NO build
```

Para instalar en un iPhone o iPad desde Xcode, selecciona un equipo en «Signing & Capabilities» y configura un identificador de aplicación disponible en tu cuenta. Para TestFlight o App Store, crea un registro en App Store Connect, archiva la app en Xcode y distribuye la compilación firmada.

## Release

1. Publica la web por HTTPS y comprueba el enlace, el guardado y la apertura sin conexión.
2. Instala el `.deb` en un equipo compatible y comprueba el inicio y el guardado tras cerrar la app.
3. Compila y prueba la app de iPhone y iPad. Distribúyela mediante TestFlight o App Store tras firmarla.
4. Crea la etiqueta `v1.0.0` para la versión validada. En el release de GitHub, adjunta el `.deb` y `agenda-web.zip`. Incluye el enlace a la web publicada y, cuando exista, el enlace de distribución de iOS.
