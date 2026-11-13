# Juan Sebastián García C.

**QA Engineer | API & Integration Testing | Python | SQL** · Disponible para trabajo remoto

Diseño pruebas de requisitos, APIs e integraciones, y automatizo su verificación con pytest,
Newman, Playwright y CI. Complemento con calidad de datos (ETL, SQL, conciliaciones) y con
evaluación de sistemas que usan IA.

## Proyectos principales

| Proyecto | Qué demuestra |
|---|---|
| [StoryLens QA](https://github.com/JuanSGarciaC/storylens-qa) · [demo](https://storylens-qa.onrender.com) | Análisis de historias de usuario, casos, sesiones, defectos y métricas; reglas deterministas con IA revisable |
| [Integrador Webhooks](https://github.com/JuanSGarciaC/integrador-webhooks) | Firma HMAC, idempotencia, reintentos con backoff, cola de fallidos; pytest + Newman |
| [NexusFlow](https://github.com/JuanSGarciaC/nexusflow) | Motor de workflows: autenticación, RBAC, webhooks, recuperación ante fallos y auditoría |

## Datos y calidad de datos

- [DataPulse](https://github.com/JuanSGarciaC/datapulse): ingesta validada con cuarentena, modelado con dbt
  y conciliaciones que el CI verifica · [caso de estudio QA](https://github.com/JuanSGarciaC/datapulse/blob/main/docs/QA_CASE_STUDY.md).
- [Datos abiertos Colombia](https://github.com/JuanSGarciaC/datos-abiertos-colombia-educacion):
  ETL de datos.gov.co con [conciliación contra la fuente](https://github.com/JuanSGarciaC/datos-abiertos-colombia-educacion/blob/main/docs/RECONCILIACION.md).
- [Triaje de solicitudes](https://github.com/JuanSGarciaC/triaje-solicitudes): clasificación con
  LLM, revisión humana y evaluación con un conjunto de prueba separado.

## IA con respaldo y evaluación medida

En mis proyectos la IA nunca decide sola: siempre hay un camino sin IA, una persona tiene
la última palabra y lo que hace el modelo se mide contra un conjunto etiquetado a mano.

| Proyecto | Respaldo | Medición |
|---|---|---|
| [StoryLens QA](https://github.com/JuanSGarciaC/storylens-qa) | Reglas deterministas citadas a su norma; la IA solo sugiere y la persona acepta o descarta | En 13 historias no vistas: reglas F1 0,71; IA F1 0,37–0,46 en tres corridas |
| [Triaje de solicitudes](https://github.com/JuanSGarciaC/triaje-solicitudes) | Aprobación automática solo con confianza ≥ 0,75 y prioridad no alta; el resto va a revisión humana | Prueba final de 10 casos: categoría 90 % con Gemini frente a 60 % con reglas |

También publico lo que salió mal: en StoryLens la evaluación destapó un bug que descartaba
hallazgos correctos, y en Triaje la confianza del modelo resultó poco calibrada.

**Stack:** Python · FastAPI · pytest · Postman/Newman · Playwright · SQL/PostgreSQL · dbt · React · GitHub Actions · Docker
