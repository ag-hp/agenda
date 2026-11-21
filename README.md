# Agenda 2026 · 2027

Agenda personal con calendario, tareas, eventos y notas. Las notas admiten dibujo, texto, subrayado, selección, plantillas, colores de papel y notas adhesivas. Las tareas y las notas se guardan en el almacenamiento local de la aplicación. Cada navegador, perfil o instalación puede tener sus propios datos.

## Probar en local

```sh
python3 -m http.server 8000 --directory web
```

Abre [http://localhost:8000](http://localhost:8000). El servidor de Python solo se usa para el desarrollo. Para alojar la agenda, publica el contenido de `web/` en cualquier alojamiento estático con HTTPS. Puedes publicarlo también bajo un subdirectorio.

## Instalar

- **Escritorio.** Abre la web con Chrome o Edge y elige «Instalar Agenda» en el menú del navegador. En Safari para macOS compatible, usa «Archivo → Añadir al Dock».
- **iPhone y iPad.** En Safari, abre la web por HTTPS y elige «Compartir → Añadir a pantalla de inicio». Abre la agenda desde su icono.
- **Sin conexión.** Visita la web al menos una vez con conexión para que el navegador descargue los archivos de la aplicación. Las fuentes externas pueden usar sus alternativas del sistema cuando no hay conexión.

La instalación anterior utiliza una aplicación web progresiva. Los pasos siguientes sirven para generar un proyecto nativo de iOS con Xcode.

## Compilar para iOS

En un Mac con Node.js 22 o posterior y Xcode 26 o posterior:

```sh
npm install
npx cap add ios
npx cap sync ios
npx cap open ios
```

Ejecuta la aplicación desde Xcode en el simulador o configura tu equipo de firma para instalarla en un dispositivo. Si editas `web/`, vuelve a ejecutar `npx cap sync ios` antes de compilar. Para distribuirla mediante TestFlight o App Store necesitarás la firma y configuración de tu cuenta de Apple Developer.
