# Usa un'immagine leggera di Python
FROM python:3.11-slim

# Imposta variabili d’ambiente
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV PORT=8080
# Crea la cartella di lavoro
WORKDIR /code

# Copia requirements e installa pacchetti Python
COPY requirements.txt /code/
RUN pip install --no-cache-dir -r requirements.txt

# Copia tutto il codice
COPY . /code/

# Raccoglie i file statici (opzionale ma utile per ambienti di produzione)
#RUN python manage.py collectstatic --noinput

# Comando di avvio
CMD ["gunicorn", "app.wsgi:application", "--bind", "0.0.0.0:8080", "--workers", "3", "--timeout", "120"]

# Esponi la porta 8080
EXPOSE 8080
