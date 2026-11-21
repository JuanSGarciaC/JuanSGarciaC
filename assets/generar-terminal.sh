#!/usr/bin/env bash
# Genera la terminal animada. Uso:
#   bash assets/generar-terminal.sh assets/terminal.svg ancho
#   bash assets/generar-terminal.sh assets/terminal-movil.svg movil
# Las cifras salen de los README y del CI de cada repo: actualízalas aquí y regenera.
export LC_ALL=C.UTF-8
out=$1; modo=${2:-ancho}
CW=8.4      # ancho de carácter (px) forzado con textLength
LH=22       # alto de línea
X0=20
# repo|comando (^ = salto de línea en móvil)|resultado|resultado corto (móvil)
blocks=(
"integrador-webhooks|pytest --cov=app|115 passed · cobertura 94 %|115 passed · cobertura 94 %"
"integrador-webhooks|newman run^docs/postman/integrador.postman_collection.json|13 peticiones · 13 aserciones · 0 fallos|13 peticiones · 13 aserciones · 0 fallos"
"nexusflow|uv run pytest --cov|373 passed · cobertura 88 % (mínimo exigido 85 %)|373 passed · cobertura 88 % (mínimo 85 %)"
"datapulse|uv run pytest --cov --cov-fail-under=90|327 pruebas · cobertura 91 % (mínimo exigido 90 %)|327 pruebas · cobertura 91 % (mínimo 90 %)"
"laboratorio-defensa|pytest -q|77 passed · 7 ataques: entran en la versión vulnerable, fallan en la endurecida|77 passed · 7 ataques: entran en la vulnerable,^no en la endurecida"
"triaje-solicitudes|python eval/run_eval.py^--csv eval/eval_final.csv|categoría correcta en la prueba final: Gemini 9/10 · reglas 6/10|categoría: Gemini 9/10 · reglas 6/10"
)
f() { awk "BEGIN{printf \"%.2f\", $1}"; }
if [ "$modo" = movil ]; then W=470; else W=860; fi

# Primero se calcula el cuerpo (para saber el alto), luego se escribe la cabecera.
body=""; y=$(( 36 + 18 + 14 )); t=0.5
add() { body+="$1"$'\n'; }
type_line() {  # x y texto: texto tecleado con una cortina que se retira por pasos
  local x=$1 yy=$2 s=$3 n=${#3}
  local w; w=$(f "$n*$CW"); local dur; dur=$(f "$n*0.028")
  add "<text x=\"$x\" y=\"$yy\" fill=\"#e6edf3\" textLength=\"$w\" lengthAdjust=\"spacing\">$s</text>"
  add "<rect class=\"c\" style=\"transform:translateX(${w}px);animation-delay:${t}s;animation-duration:${dur}s;animation-timing-function:steps($((n+1)),jump-none)\" x=\"$(f "$x-1")\" y=\"$((yy-15))\" width=\"$(f "$w+14")\" height=\"20\" fill=\"#0d1117\"/>"
  t=$(f "$t + $dur + 0.1")
}
for b in "${blocks[@]}"; do
  IFS='|' read -r repo cmd res corto <<<"$b"
  add "<g>"
  if [ "$modo" = movil ]; then
    # el repo va en su propia línea para que los comandos quepan en 470 px
    add "<text class=\"p\" style=\"animation-delay:${t}s\" x=\"$X0\" y=\"$y\" fill=\"#58a6ff\"># $repo</text>"
    y=$((y+LH))
    add "<text class=\"p\" style=\"animation-delay:${t}s\" x=\"$X0\" y=\"$y\" fill=\"#9198a1\">\$</text>"
    IFS='^' read -r -a segs <<<"$cmd"; i=0
    for s in "${segs[@]}"; do
      [ $i -gt 0 ] && y=$((y+LH))
      [ $i -lt $(( ${#segs[@]} - 1 )) ] && s="$s \\"
      type_line "$(f "$X0+$(( i==0 ? 2 : 4 ))*$CW")" "$y" "$s"; i=$((i+1))
    done
    res=$corto
  else
    pre="$repo \$"; np=$(( ${#pre} + 1 ))
    add "<text class=\"p\" style=\"animation-delay:${t}s\" x=\"$X0\" y=\"$y\" textLength=\"$(f "${#pre}*$CW")\" lengthAdjust=\"spacing\"><tspan fill=\"#58a6ff\">$repo</tspan><tspan fill=\"#9198a1\"> \$</tspan></text>"
    type_line "$(f "$X0+$np*$CW")" "$y" "${cmd//^/ }"
  fi
  t=$(f "$t + 0.15")
  IFS='^' read -r -a rl <<<"$res"; i=0
  for r in "${rl[@]}"; do
    y=$((y+LH))
    if [ $i -eq 0 ]; then mark="<tspan fill=\"#3fb950\">✓</tspan> "; else mark="  "; fi
    add "<text class=\"o\" style=\"animation-delay:${t}s\" x=\"$X0\" y=\"$y\" fill=\"#9198a1\" xml:space=\"preserve\">$mark$r</text>"
    i=$((i+1))
  done
  add "</g>"
  t=$(f "$t + 0.45")
  y=$((y + LH + 8))
done
add "<g class=\"p\" style=\"animation-delay:${t}s\"><text x=\"$X0\" y=\"$y\" fill=\"#9198a1\">\$</text><rect class=\"k\" x=\"$(f "$X0+2*$CW")\" y=\"$((y-13))\" width=\"8\" height=\"16\" fill=\"#e6edf3\"/></g>"
H=$((y + 14))

{
cat <<HDR
<svg xmlns="http://www.w3.org/2000/svg" width="$W" height="$H" viewBox="0 0 $W $H" role="img" aria-labelledby="t d" font-family="ui-monospace,SFMono-Regular,'SF Mono',Menlo,Consolas,'Liberation Mono',monospace" font-size="14">
<title id="t">Terminal con las pruebas de los proyectos</title>
<desc id="d">Integrador de webhooks: 115 pruebas pasan, cobertura 94 %; Newman: 13 peticiones, 13 aserciones, 0 fallos. NexusFlow: 373 pruebas, cobertura 88 % con mínimo 85 %. DataPulse: 327 pruebas, cobertura 91 % con mínimo 90 %. Laboratorio de defensa: 77 pruebas; los 7 ataques entran en la versión vulnerable y fallan en la endurecida. Triaje de solicitudes: categoría correcta en 9 de 10 casos con Gemini y 6 de 10 con reglas.</desc>
<style>
.c{animation:type 1s both}
.o,.p{animation:show .25s ease-out both}
.k{animation:blink 1.1s steps(1) infinite}
@keyframes type{from{transform:translateX(0)}}
@keyframes show{from{opacity:0}}
@keyframes blink{50%{opacity:0}}
@media (prefers-reduced-motion:reduce){*{animation:none!important}}
</style>
<clipPath id="dentro"><rect x="1" y="37" width="$((W-2))" height="$((H-38))"/></clipPath>
<rect x=".5" y=".5" width="$((W-1))" height="$((H-1))" rx="10" fill="#0d1117" stroke="#30363d"/>
<path d="M.5 36V10.5a10 10 0 0 1 10-10h$((W-21))a10 10 0 0 1 10 10V36z" fill="#161b22"/>
<line x1="0" y1="36" x2="$W" y2="36" stroke="#30363d"/>
<circle cx="22" cy="18" r="5.5" fill="#484f58"/><circle cx="40" cy="18" r="5.5" fill="#484f58"/><circle cx="58" cy="18" r="5.5" fill="#484f58"/>
<text x="$((W/2))" y="23" text-anchor="middle" fill="#9198a1" font-size="13">~/proyectos · pruebas</text>
<g clip-path="url(#dentro)">
HDR
printf '%s' "$body"
echo "</g>"
echo "</svg>"
} > "$out"
