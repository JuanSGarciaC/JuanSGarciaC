#!/usr/bin/env bash
# Genera la terminal animada. Uso: bash assets/generar-terminal.sh assets/terminal.svg
# Las cifras salen de los README y del CI de cada repo: actualízalas aquí y regenera.
export LC_ALL=C.UTF-8
out=$1
CW=8.4      # ancho de carácter (px) forzado con textLength
LH=22       # alto de línea
X0=20
# repo|comando|resultado
blocks=(
"integrador-webhooks|pytest --cov=app|115 passed · cobertura 94 %"
"integrador-webhooks|newman run docs/postman/integrador.postman_collection.json|13 peticiones · 13 aserciones · 0 fallos"
"nexusflow|uv run pytest --cov|373 passed · cobertura 88 % (mínimo exigido 85 %)"
"datapulse|uv run pytest --cov --cov-fail-under=90|286 passed · cobertura 91 %"
"laboratorio-defensa|pytest -q|45 passed · 4 ataques: entran en la versión vulnerable, fallan en la endurecida"
"triaje-solicitudes|python eval/run_eval.py --csv eval/eval_final.csv|categoría correcta en la prueba final: Gemini 9/10 · reglas 6/10"
)
n=${#blocks[@]}
H=$(( 36 + 18 + n*2*LH + (n-1)*8 + LH + 14 ))
W=860
f() { awk "BEGIN{printf \"%.2f\", $1}"; }
{
cat <<HDR
<svg xmlns="http://www.w3.org/2000/svg" width="$W" height="$H" viewBox="0 0 $W $H" role="img" aria-labelledby="t d" font-family="ui-monospace,SFMono-Regular,'SF Mono',Menlo,Consolas,'Liberation Mono',monospace" font-size="14">
<title id="t">Terminal con las pruebas de los proyectos</title>
<desc id="d">Integrador de webhooks: 115 pruebas pasan, cobertura 94 %; Newman: 13 peticiones, 13 aserciones, 0 fallos. NexusFlow: 373 pruebas, cobertura 88 % con mínimo 85 %. DataPulse: 286 pruebas, cobertura 91 % con mínimo 90 %. Laboratorio de defensa: 45 pruebas; los 4 ataques entran en la versión vulnerable y fallan en la endurecida. Triaje de solicitudes: categoría correcta en 9 de 10 casos con Gemini y 6 de 10 con reglas.</desc>
<style>
.c{animation:type 1s both}
.o,.p{animation:show .25s ease-out both}
.k{animation:blink 1.1s steps(1) infinite}
@keyframes type{from{transform:translateX(0)}}
@keyframes show{from{opacity:0}}
@keyframes blink{50%{opacity:0}}
@media (prefers-reduced-motion:reduce){*{animation:none!important}}
</style>
<rect x=".5" y=".5" width="$((W-1))" height="$((H-1))" rx="10" fill="#0d1117" stroke="#30363d"/>
<path d="M.5 36V10.5a10 10 0 0 1 10-10h$((W-21))a10 10 0 0 1 10 10V36z" fill="#161b22"/>
<line x1="0" y1="36" x2="$W" y2="36" stroke="#30363d"/>
<circle cx="22" cy="18" r="5.5" fill="#484f58"/><circle cx="40" cy="18" r="5.5" fill="#484f58"/><circle cx="58" cy="18" r="5.5" fill="#484f58"/>
<text x="$((W/2))" y="23" text-anchor="middle" fill="#9198a1" font-size="13">~/proyectos · pruebas</text>
HDR
y=$(( 36 + 18 + 14 ))
t=0.5
for b in "${blocks[@]}"; do
  IFS='|' read -r repo cmd res <<<"$b"
  pre="$repo \$ "
  np=${#pre}; nc=${#cmd}
  xc=$(f "$X0 + $np*$CW"); wc=$(f "$nc*$CW"); dur=$(f "$nc*0.028")
  echo "<g>"
  echo "<text class=\"p\" style=\"animation-delay:${t}s\" x=\"$X0\" y=\"$y\" textLength=\"$(f "($np-1)*$CW")\" lengthAdjust=\"spacing\"><tspan fill=\"#58a6ff\">$repo</tspan><tspan fill=\"#9198a1\"> \$</tspan></text>"
  echo "<text x=\"$xc\" y=\"$y\" fill=\"#e6edf3\" textLength=\"$wc\" lengthAdjust=\"spacing\">$cmd</text>"
  echo "<rect class=\"c\" style=\"transform:translateX(${wc}px);animation-delay:${t}s;animation-duration:${dur}s;animation-timing-function:steps($nc)\" x=\"$(f "$xc-1")\" y=\"$((y-15))\" width=\"$(f "$wc+14")\" height=\"20\" fill=\"#0d1117\"/>"
  t=$(f "$t + $dur + 0.25")
  y2=$((y+LH))
  echo "<text class=\"o\" style=\"animation-delay:${t}s\" x=\"$X0\" y=\"$y2\" fill=\"#9198a1\"><tspan fill=\"#3fb950\">✓</tspan> $res</text>"
  echo "</g>"
  t=$(f "$t + 0.45")
  y=$((y + 2*LH + 8))
done
echo "<g class=\"p\" style=\"animation-delay:${t}s\"><text x=\"$X0\" y=\"$y\" fill=\"#9198a1\">\$</text><rect class=\"k\" x=\"$(f "$X0+2*$CW")\" y=\"$((y-13))\" width=\"8\" height=\"16\" fill=\"#e6edf3\"/></g>"
echo "</svg>"
} > "$out"
