# Django App Runner Demo

Una mini-app Django pronta per essere eseguita in container su AWS App Runner.

## Esecuzione locale

```bash
docker build -t django-app .
docker run -p 8080:8080 django-app
```

Poi visita: http://localhost:8000

## Deploy su App Runner

- Collega questo repo a GitHub
- Crea un nuovo servizio App Runner
- Seleziona "Dockerfile" come metodo di deploy
- Done!
