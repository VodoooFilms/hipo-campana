#!/usr/bin/env bash
# Regenera los códigos QR de la campaña.
#
#   ./campaign/regenerar-qr.sh                 # sólo el de PayPal
#   ./campaign/regenerar-qr.sh https://mi.url  # PayPal + el de la página
#
# Necesita `uv` (ya está instalado en esta máquina).
set -euo pipefail
cd "$(dirname "$0")"

PAGINA="${1:-}"

uv run --quiet --with "qrcode[pil]" python - "$PAGINA" <<'PY'
import sys
import qrcode
from qrcode.image.styledpil import StyledPilImage
from qrcode.image.styles.moduledrawers.pil import RoundedModuleDrawer
from qrcode.image.styles.colormasks import SolidFillColorMask

INK = (22, 19, 15)


def make(text, path):
    qr = qrcode.QRCode(error_correction=qrcode.constants.ERROR_CORRECT_M, box_size=32, border=3)
    qr.add_data(text)
    qr.make(fit=True)
    img = qr.make_image(
        image_factory=StyledPilImage,
        module_drawer=RoundedModuleDrawer(),
        color_mask=SolidFillColorMask(back_color=(255, 255, 255), front_color=INK),
    ).convert("RGB")
    img.save(path, optimize=True)
    print(f"{path} · {img.size[0]}x{img.size[1]} px · {text}")


make("https://paypal.me/antoniomartinez75", "assets/qr-paypal.png")
if len(sys.argv) > 1 and sys.argv[1].strip():
    make(sys.argv[1].strip(), "assets/qr-pagina.png")
else:
    print("sin URL de página: no se regeneró qr-pagina.png")
PY
