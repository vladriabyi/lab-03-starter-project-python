FROM python:3.10-alpine

WORKDIR /app

COPY requirements/backend.in /app/backend.in
RUN python3 -m venv ./.venv && \
    /bin/sh -c ". ./.venv/bin/activate && pip install --no-cache-dir -r /app/backend.in"

COPY build /app/build
COPY spaceship /app/spaceship

CMD ["./.venv/bin/uvicorn", "spaceship.main:app", "--host", "0.0.0.0", "--port", "8000"]
