# Agenda 2026 · 2027

Agenda personal para organizar eventos y tareas, tomar notas y llevar un registro de tus lecturas.

**[Abrir la agenda en GitHub Pages](https://ag-hp.github.io/agenda-2026-2027/prueba-cuentas.html)**

## Qué puedes hacer

- **Calendario.** Anota tareas, eventos y cumpleaños, y conecta Google Calendar para consultar tus eventos.
- **Notas.** Crea notas con texto, dibujo, subrayado, plantillas, colores de papel y notas adhesivas.
- **Libros.** Busca por título o autor, añade libros a tu galería de portadas y guarda una valoración y un comentario en cada ficha.

En la agenda publicada puedes crear una cuenta o entrar con Google. Las notas, los eventos que añades y tu colección de libros se guardan en tu cuenta.

## Probar en local

Desde la raíz del repositorio, ejecuta:

```sh
python3 -m http.server 8000 --directory agenda-2026-2027/web
```

Abre [http://localhost:8000](http://localhost:8000) para probar la versión local, que usa el almacenamiento del navegador. El servidor de Python solo se usa para el desarrollo. Para alojar la agenda, puedes publicar la carpeta `agenda-2026-2027/web/` en un alojamiento estático con HTTPS.

## Instalar la versión local

- **Escritorio.** Abre la web con Chrome o Edge y elige «Instalar Agenda». En Safari para macOS compatible, usa «Archivo → Añadir al Dock».
- **iPhone y iPad.** En Safari, abre la web por HTTPS y elige «Compartir → Añadir a pantalla de inicio».
- **Sin conexión.** Visita la web al menos una vez con conexión para que el navegador descargue los archivos de la aplicación.

## Compilar para iOS

En un Mac con Node.js 22 o posterior y Xcode 26 o posterior, abre la carpeta `agenda-2026-2027/` y ejecuta:

```sh
npm install
npx cap add ios
npx cap sync ios
npx cap open ios
```

Ejecuta la aplicación desde Xcode en el simulador o configura tu equipo de firma para instalarla en un dispositivo. Si editas `web/`, vuelve a ejecutar `npx cap sync ios` antes de compilar. Para distribuirla mediante TestFlight o App Store, necesitarás la firma y la configuración de tu cuenta de Apple Developer.
