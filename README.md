# Juan Sebastián García C.

**QA Engineer · API & Integration Testing · Python · SQL**

Disponible para trabajo remoto · [LinkedIn](https://www.linkedin.com/in/juansgc)

Diseño pruebas de requisitos, APIs e integraciones, y automatizo su verificación con pytest,
Newman, Playwright y CI. Complemento con calidad de datos (ETL, SQL, conciliaciones), pruebas de
seguridad web (OWASP Top 10) y evaluación de sistemas que usan IA.

<img src="assets/terminal.svg" width="860" alt="Terminal que corre las pruebas de seis proyectos: Integrador de webhooks, 115 pruebas y 94 % de cobertura, y Newman con 13 aserciones sin fallos; NexusFlow, 373 pruebas y 88 % de cobertura; DataPulse, 286 pruebas y 91 %; Laboratorio de defensa, 45 pruebas y 4 ataques que entran en la versión vulnerable y fallan en la endurecida; Triaje de solicitudes, categoría correcta en 9 de 10 casos con Gemini y 6 de 10 con reglas">

**Demos en vivo:** [StoryLens QA](https://storylens-qa.onrender.com) ·
[Integrador de webhooks](https://integrador-webhooks-demo.onrender.com) ·
[Triaje de solicitudes](https://triaje-solicitudes-demo.onrender.com)

<sub>Hosting gratuito: si nadie las visitó en los últimos 15 minutos, la primera carga tarda cerca de un minuto.</sub>

## Proyectos

Cada repositorio trae pruebas automáticas, CI en cada push y capturas del sistema real.

<table>
<tr>
<td width="50%" valign="top">
<a href="https://github.com/JuanSGarciaC/storylens-qa"><img src="https://raw.githubusercontent.com/JuanSGarciaC/storylens-qa/main/docs/screenshots/flujo-en-vivo.gif" alt="StoryLens QA analiza una historia de usuario y cita cada hallazgo a su norma"></a>
<h3>StoryLens QA</h3>
<sub>QA · requisitos y diseño de pruebas</sub>
<p>Analiza historias de usuario antes de que se vuelvan defectos, genera casos de prueba trazables, organiza sesiones con evidencias y resume todo en métricas. Reglas deterministas siempre; la IA solo sugiere.</p>
<p><sub>Python · FastAPI · React · pytest · Playwright</sub></p>
<a href="https://github.com/JuanSGarciaC/storylens-qa">Código</a> · <a href="https://storylens-qa.onrender.com">Demo</a> · <a href="https://storylens-qa.onrender.com/probar">Prueba tu historia</a>
</td>
<td width="50%" valign="top">
<a href="https://github.com/JuanSGarciaC/laboratorio-defensa"><img src="https://raw.githubusercontent.com/JuanSGarciaC/laboratorio-defensa/main/docs/img/fuerza-bruta.gif" alt="Fuerza bruta de login: entra en la versión vulnerable y queda bloqueada en la endurecida"></a>
<h3>Laboratorio de defensa</h3>
<sub>Seguridad · pruebas de ataque y endurecimiento</sub>
<p>La misma aplicación web escrita dos veces, vulnerable y endurecida. Un lienzo lanza inyección SQL, XSS, recorrido de rutas y fuerza bruta, y una prueba objetiva dice cuál tuvo éxito. Los ataques no salen del proceso.</p>
<p><sub>Python · FastAPI · React · pytest · Playwright</sub></p>
<a href="https://github.com/JuanSGarciaC/laboratorio-defensa">Código</a> · <a href="https://github.com/JuanSGarciaC/laboratorio-defensa#resultados-medidos">Resultados medidos</a>
</td>
</tr>
<tr>
<td width="50%" valign="top">
<a href="https://github.com/JuanSGarciaC/nexusflow"><img src="https://raw.githubusercontent.com/JuanSGarciaC/nexusflow/main/docs/screenshots/03-editor-flujo.png" alt="Editor de flujos de NexusFlow"></a>
<h3>NexusFlow</h3>
<sub>Backend · automatización de procesos</sub>
<p>Motor de workflows con pasos, condiciones y acciones contra APIs externas. Autenticación, RBAC, webhooks firmados, idempotencia, recuperación ante fallos y auditoría.</p>
<p><sub>Python · FastAPI · PostgreSQL · Celery · Redis · React</sub></p>
<a href="https://github.com/JuanSGarciaC/nexusflow">Código</a> · <a href="https://github.com/JuanSGarciaC/nexusflow/blob/main/docs/demo.md">Guion de la demo</a>
</td>
<td width="50%" valign="top">
<a href="https://github.com/JuanSGarciaC/datapulse"><img src="https://raw.githubusercontent.com/JuanSGarciaC/datapulse/main/docs/img/dashboard-demo.gif" alt="Mapa del pipeline de DataPulse en movimiento"></a>
<h3>DataPulse</h3>
<sub>Datos · ingeniería y calidad</sub>
<p>Convierte CSV, JSON y una API REST paginada en datos confiables y trazables: ingesta validada con cuarentena, orquestación con Prefect, modelo estrella con dbt y conciliaciones que el CI verifica.</p>
<p><sub>Python · PostgreSQL · Prefect · dbt · Polars · Streamlit</sub></p>
<a href="https://github.com/JuanSGarciaC/datapulse">Código</a> · <a href="https://github.com/JuanSGarciaC/datapulse/blob/main/docs/QA_CASE_STUDY.md">Caso de estudio QA</a>
</td>
</tr>
<tr>
<td width="50%" valign="top">
<a href="https://github.com/JuanSGarciaC/triaje-solicitudes"><img src="https://raw.githubusercontent.com/JuanSGarciaC/triaje-solicitudes/main/docs/img/demo-lienzo.gif" alt="Una solicitud urgente recorre el lienzo: clasificador, política y revisión humana"></a>
<h3>Triaje de solicitudes</h3>
<sub>IA aplicada · evaluación y revisión humana</sub>
<p>Clasifica solicitudes de soporte de TI con un LLM y decide si se aprueban solas o pasan a una persona. Lienzo con el camino de cada solicitud y evaluación con casos etiquetados.</p>
<p><sub>Python · FastAPI · React · Gemini · pytest</sub></p>
<a href="https://github.com/JuanSGarciaC/triaje-solicitudes">Código</a> · <a href="https://triaje-solicitudes-demo.onrender.com">Demo</a> · <a href="https://triaje-solicitudes-demo.onrender.com/docs">API</a>
</td>
<td width="50%" valign="top">
<a href="https://github.com/JuanSGarciaC/integrador-webhooks"><img src="https://raw.githubusercontent.com/JuanSGarciaC/integrador-webhooks/main/docs/screenshots/demo-flujo.gif" alt="Un webhook falla dos veces con 503 y se entrega al tercer intento"></a>
<h3>Integrador de webhooks</h3>
<sub>QA · APIs e integraciones</sub>
<p>Recibe webhooks de GitHub, valida la firma HMAC, los guarda y los entrega desde un worker. Idempotencia, reintentos con backoff y jitter, y cola de fallidos que una persona reprocesa.</p>
<p><sub>Python · FastAPI · React · pytest · Newman</sub></p>
<a href="https://github.com/JuanSGarciaC/integrador-webhooks">Código</a> · <a href="https://integrador-webhooks-demo.onrender.com">Demo</a> · <a href="https://integrador-webhooks-demo.onrender.com/docs">API</a>
</td>
</tr>
<tr>
<td width="50%" valign="top">
<a href="https://github.com/JuanSGarciaC/cortex-agent"><img src="https://raw.githubusercontent.com/JuanSGarciaC/cortex-agent/main/docs/img/inicio.png" alt="Pantalla de inicio de Cortex Agent"></a>
<h3>Cortex Agent</h3>
<sub>IA aplicada · agentes y evals</sub>
<p>Harness de agente escrito a mano, sin frameworks: herramientas por MCP, RAG híbrido con citas, memoria de largo plazo y evals con juez, con vistas para ver cada paso del agente.</p>
<p><sub>Python · FastAPI · TypeScript · React · SQLite · MCP</sub></p>
<a href="https://github.com/JuanSGarciaC/cortex-agent">Código</a>
</td>
<td width="50%" valign="top"></td>
</tr>
</table>

## Qué pruebo y cómo

| Área | Lo que hago | Dónde verlo |
|---|---|---|
| Requisitos | Reviso historias de usuario contra reglas citadas a su norma y derivo casos trazables | [StoryLens QA](https://github.com/JuanSGarciaC/storylens-qa) |
| APIs e integraciones | Firma HMAC, idempotencia, reintentos y permisos, con pytest y Newman | [Integrador de webhooks](https://github.com/JuanSGarciaC/integrador-webhooks) · [NexusFlow](https://github.com/JuanSGarciaC/nexusflow) |
| Contratos | El CI falla si el OpenAPI cambia sin regenerarse, y un job compara la simulación con la API pública real | [Integrador de webhooks](https://github.com/JuanSGarciaC/integrador-webhooks) · [DataPulse](https://github.com/JuanSGarciaC/datapulse) |
| Interfaz de punta a punta | Playwright contra el sistema real levantado en Docker | [StoryLens QA](https://github.com/JuanSGarciaC/storylens-qa) · [NexusFlow](https://github.com/JuanSGarciaC/nexusflow) · [Integrador de webhooks](https://github.com/JuanSGarciaC/integrador-webhooks) · [Triaje de solicitudes](https://github.com/JuanSGarciaC/triaje-solicitudes) · [Laboratorio de defensa](https://github.com/JuanSGarciaC/laboratorio-defensa) |
| Accesibilidad | axe en las pruebas de componentes y de punta a punta, contra WCAG 2.1 AA | [StoryLens QA](https://github.com/JuanSGarciaC/storylens-qa) |
| Carga y recuperación | k6 sobre ejecuciones concurrentes y límites de uso; copia de PostgreSQL con restauración verificada en el CI | [NexusFlow](https://github.com/JuanSGarciaC/nexusflow) |
| Calidad de datos | Validación con cuarentena, pruebas de dbt y conciliación de totales contra la fuente | [DataPulse](https://github.com/JuanSGarciaC/datapulse) |
| Seguridad web | Ataques del OWASP Top 10 automatizados contra una versión vulnerable y otra endurecida, con prueba objetiva de éxito | [Laboratorio de defensa](https://github.com/JuanSGarciaC/laboratorio-defensa) |
| Seguridad en el CI | Auditoría de dependencias (pip-audit), análisis estático (Bandit), imágenes Docker (Trivy) y secretos en el historial (gitleaks) | [NexusFlow](https://github.com/JuanSGarciaC/nexusflow) · [DataPulse](https://github.com/JuanSGarciaC/datapulse) · [StoryLens QA](https://github.com/JuanSGarciaC/storylens-qa) |
| Sistemas con IA | Conjunto etiquetado a mano, métricas por clase, revisión humana, inyección de instrucciones y evals con juez | [Triaje de solicitudes](https://github.com/JuanSGarciaC/triaje-solicitudes) · [StoryLens QA](https://github.com/JuanSGarciaC/storylens-qa) · [Cortex Agent](https://github.com/JuanSGarciaC/cortex-agent) |

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="assets/cobertura-oscuro.svg">
  <img src="assets/cobertura-claro.svg" width="860" alt="Gráfica de cobertura en escala de 0 a 100 %: Integrador de webhooks 94 %; DataPulse 91 % con mínimo exigido 90 %; backend de NexusFlow 88 % con mínimo exigido 85 %">
</picture>

Cobertura medida en el CI: 94 % en el Integrador de webhooks, 91 % en DataPulse (mínimo exigido 90 %) y 88 % en el backend de NexusFlow (mínimo exigido 85 %).

## IA con respaldo y evaluación medida

En mis proyectos la IA no decide sola: hay un camino sin IA, una persona tiene la última
palabra en las decisiones y lo que hace el modelo se mide contra casos etiquetados a mano.

| Proyecto | Respaldo | Medición |
|---|---|---|
| [StoryLens QA](https://github.com/JuanSGarciaC/storylens-qa) | Reglas deterministas citadas a su norma; la IA solo sugiere y la persona acepta o descarta | En 13 historias no vistas: reglas F1 0,71; IA F1 0,37–0,46 en tres corridas |
| [Triaje de solicitudes](https://github.com/JuanSGarciaC/triaje-solicitudes) | Aprobación automática solo con confianza ≥ 0,75 y prioridad no alta; el resto va a revisión humana | Prueba final de 10 casos: categoría 90 % con Gemini frente a 60 % con reglas |
| [Cortex Agent](https://github.com/JuanSGarciaC/cortex-agent) | La búsqueda y los evals de retrieval funcionan sin modelo; cada paso del agente queda en una traza consultable | Eval de agente con juez: de 5 a 6 casos de 6 según el modelo y la corrida (Gemini y un modelo local); recall@k y MRR en el CI |

También publico lo que salió mal: en StoryLens la evaluación destapó un bug que descartaba
hallazgos correctos, en Triaje la confianza del modelo resultó poco calibrada y Cortex Agent
quedó sin probar con la API de Claude.

## Stack

- **Pruebas**: pytest · Postman/Newman · Playwright · Vitest · Testing Library · axe · k6
- **Calidad de código**: Ruff · mypy · ESLint · cobertura con mínimo exigido en el CI
- **Seguridad**: OWASP Top 10 · pip-audit · Bandit · Trivy · gitleaks
- **Backend y APIs**: Python · FastAPI · Celery · Redis · OpenAPI
- **Datos**: SQL · PostgreSQL · SQLite · dbt · Prefect · Polars
- **IA**: Gemini · Ollama · MCP · RAG híbrido (BM25 y vectores) · evals con juez
- **Frontend**: React · TypeScript · Vite · Streamlit
- **Observabilidad**: Prometheus · Grafana
- **Entrega**: GitHub Actions · Docker · Docker Compose

## Contacto

[LinkedIn](https://www.linkedin.com/in/juansgc) · Disponible para trabajo remoto

---

<sub>El código de estos repositorios se publica para consulta. Todos los derechos reservados: su uso, copia o distribución requiere mi autorización por escrito.</sub>
