FROM python:3.10-slim

RUN pip install --no-cache-dir \
    "uvicorn[standard]==0.18.2" \
    gunicorn==20.1.0 \
    fastapi==0.79.0

COPY ./start.sh /start.sh
COPY ./gunicorn_conf.py /gunicorn_conf.py
COPY ./start-reload.sh /start-reload.sh

COPY ./app /app
WORKDIR /app/

ENV PYTHONPATH=/app

EXPOSE 80

# Run the start script, it will check for an /app/prestart.sh script (e.g. for migrations)
# And then will start Gunicorn with Uvicorn
CMD ["/start.sh"]
