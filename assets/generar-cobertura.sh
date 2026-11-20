#!/usr/bin/env bash
# Genera la gráfica de cobertura. Uso:
#   bash assets/generar-cobertura.sh assets/cobertura-claro.svg light
#   bash assets/generar-cobertura.sh assets/cobertura-oscuro.svg dark
export LC_ALL=C.UTF-8
out=$1; theme=$2
if [ "$theme" = dark ]; then TX=#e6edf3; MU=#9198a1; TR=#21262d; BAR=#3fb950
else TX=#1f2328; MU=#59636e; TR=#eaeef2; BAR=#1f883d; fi
# etiqueta|cobertura|mínimo (vacío si no hay)
rows=("Integrador de webhooks|94|" "DataPulse|91|90" "NexusFlow (backend)|88|85")
W=860; BX=220; BW=540; ROW=56; TOP=64
H=$((TOP + ${#rows[@]}*ROW - 10))
f() { awk "BEGIN{printf \"%.2f\", $1}"; }
DUR=1.2; FR=9
{
cat <<HDR
<svg xmlns="http://www.w3.org/2000/svg" width="$W" height="$H" viewBox="0 0 $W $H" role="img" aria-labelledby="t d" font-family="-apple-system,BlinkMacSystemFont,'Segoe UI','Noto Sans',Helvetica,Arial,sans-serif" font-size="14">
<title id="t">Cobertura de pruebas medida en el CI</title>
<desc id="d">Integrador de webhooks 94 %. DataPulse 91 %, mínimo exigido 90 %. Backend de NexusFlow 88 %, mínimo exigido 85 %. Escala de 0 a 100 %.</desc>
<style>
.b{transform-box:fill-box;transform-origin:0 50%;animation:grow ${DUR}s linear both}
.f{opacity:0;animation:flash 1s step-end}
.v,.m{animation:show .3s ease-out both}
@keyframes grow{from{transform:scaleX(0)}}
@keyframes flash{0%{opacity:1}100%{opacity:0}}
@keyframes show{from{opacity:0}}
@media (prefers-reduced-motion:reduce){*{animation:none!important}}
</style>
<text x="0" y="20" fill="$TX" font-size="16" font-weight="600">Cobertura de pruebas medida en el CI</text>
<text x="0" y="42" fill="$MU" font-size="13">Escala de 0 a 100 %. La línea marca el mínimo que exige el CI: por debajo, el build falla.</text>
HDR
i=0
for r in "${rows[@]}"; do
  IFS='|' read -r lab v min <<<"$r"
  y=$((TOP + i*ROW)); d=$(f "0.3 + $i*0.25")
  bw=$(f "$BW*$v/100")
  echo "<text x=\"0\" y=\"$((y+15))\" fill=\"$TX\">$lab</text>"
  echo "<rect x=\"$BX\" y=\"$y\" width=\"$BW\" height=\"20\" rx=\"3\" fill=\"$TR\"/>"
  echo "<rect class=\"b\" style=\"animation-delay:${d}s\" x=\"$BX\" y=\"$y\" width=\"$bw\" height=\"20\" rx=\"3\" fill=\"$BAR\"/>"
  vx=$((BX+BW+14))
  # cuenta: fotogramas intermedios visibles solo en su ventana; el último queda
  for k in $(seq 0 $((FR-1))); do
    fv=$(awk "BEGIN{printf \"%d\", $v*$k/$FR}")
    fd=$(f "$d + $k*$DUR/$FR"); fl=$(f "$DUR/$FR")
    echo "<text class=\"f\" style=\"animation-delay:${fd}s;animation-duration:${fl}s\" x=\"$vx\" y=\"$((y+15))\" fill=\"$TX\" font-weight=\"600\">$fv %</text>"
  done
  echo "<text class=\"v\" style=\"animation-delay:$(f "$d+$DUR")s;animation-duration:.01s\" x=\"$vx\" y=\"$((y+15))\" fill=\"$TX\" font-weight=\"600\">$v %</text>"
  if [ -n "$min" ]; then
    mx=$(f "$BX + $BW*$min/100")
    echo "<g class=\"m\" style=\"animation-delay:$(f "$d+$DUR")s\"><line x1=\"$mx\" y1=\"$((y-4))\" x2=\"$mx\" y2=\"$((y+24))\" stroke=\"$TX\" stroke-width=\"2\"/><text x=\"$mx\" y=\"$((y+38))\" text-anchor=\"middle\" fill=\"$MU\" font-size=\"12\">mín. $min %</text></g>"
  fi
  i=$((i+1))
done
echo "</svg>"
} > "$out"
