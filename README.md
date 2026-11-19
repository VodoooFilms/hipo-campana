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

## Publicada

- **Página:** <https://vodooofilms.github.io/hipo-campana/>
- **Repositorio:** <https://github.com/VodoooFilms/hipo-campana> (público, rama `main`)
- El reproductor **no** tiene autoplay, por decisión editorial: se reproduce
  con música solo cuando la persona hace clic.
- Para actualizar: editar, `git commit` y `git push` dentro de `campaign/`.
  GitHub Pages republica solo en 1–2 minutos.

Nota: la cuenta tenía `tobybots.com` como dominio personalizado en el repo
`vodooofilms.github.io`, lo que redirigía todas las páginas hacia Firebase y
daba 404. Se retiró ese dominio solo de la configuración de GitHub;
`tobybots.com` sigue alojado en Firebase, sin cambios.

## Códigos QR

- `assets/qr-pagina.png` → la dirección publicada (arriba). Copia suelta en el
  Escritorio: `HIPO-QR-pagina.png` (1248×1248, listo para imprimir).
- `assets/qr-paypal.png` → `https://paypal.me/antoniomartinez75`. Copia suelta:
  `HIPO-QR-paypal.png`.
- Para regenerarlos: `./campaign/regenerar-qr.sh https://vodooofilms.github.io/hipo-campana/`

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
