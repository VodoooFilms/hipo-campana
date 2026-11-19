# Campaña de crowdfunding — HIPO

Página estática, un solo archivo HTML con el CSS adentro. No necesita
servidor, ni frameworks, ni cookies. Se puede abrir con doble clic o subir a
cualquier hosting.

## Archivos

```
campaign/
  index.html            la página completa
  assets/og.jpg         tarjeta para compartir en redes, desde un frame (1200×630)
  assets/poster.jpg     primer fotograma del video
  assets/still-*.jpg    fotogramas del teaser
  assets/teaser.mp4     teaser comprimido para web (20 MB, 1280 px)
  assets/qr-paypal.png  QR a paypal.me/antoniomartinez75
  assets/qr-pagina.png  QR a esta página (pendiente: falta la dirección)
  regenerar-qr.sh       vuelve a generar los QR
```

## Verla en tu computadora

```bash
cd campaign && python3 -m http.server 8765
# abrir http://localhost:8765
```

El video necesita servidor local; con `file://` algunos navegadores lo bloquean.

## Publicarla

Cualquiera de estas, en orden de facilidad:

1. **Netlify Drop** — <https://app.netlify.com/drop>. Arrastra la carpeta
   `campaign/` y obtienes una dirección `https://algo.netlify.app` al instante.
2. **GitHub Pages** — subir la carpeta a un repo y activar Pages.
3. **Vercel** — `npx vercel` dentro de `campaign/`.

Cualquiera sirve; lo importante es que la dirección quede fija porque el QR y
las redes apuntan ahí.

## Después de publicar: el QR de la página

```bash
./campaign/regenerar-qr.sh https://la-direccion-final.com
```

Eso reescribe `assets/qr-pagina.png` con la dirección real. Después hay que
volver a subir la carpeta. Mientras no lo hagas, el QR de la página es un
marcador que dice «pendiente» y **no** debe imprimirse.

El QR de PayPal ya funciona y apunta a `https://paypal.me/antoniomartinez75`.

## Qué conviene revisar antes de publicar

- **Meta**: hoy dice USD 6.000 y el desglose suma eso. Si cambia, hay que
  ajustar el monto y las dos columnas del bloque «La meta» en `index.html`.
- **Recompensas**: tres niveles ($5, $15 y $50). Los precios y lo que incluye
  cada uno son propuestas; confírmalos antes de publicar.
- **Datos de cobro**: Cooperativa 29 de Octubre, cuenta de ahorros
  441010019319, José Antonio Martínez Valdez, celular 098 386 1602 y PayPal.
  La cédula **no** se publica en la página.
- **Textos**: la historia está armada con `data/guion.md` y
  `data/characters.json`. Si quieres contar otra cosa, se cambia solo el HTML.
- **Alcance**: la campaña es solo para la **animación** del corto. No se
  menciona venta ni impresión de libros.

## Música y créditos

El teaser usa «Memories of Stone» de **Scott Buckley**, licencia **CC BY 4.0**.
El crédito ya está en el pie de la página; hay que mantenerlo en el video
publicado y en la campaña.
