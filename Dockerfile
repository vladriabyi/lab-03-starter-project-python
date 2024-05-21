FROM python:3.10-buster

WORKDIR /app

COPY build /app/build
COPY spaceship /app/spaceship
COPY requirements/backend.in /app/backend.in

RUN python3 -m venv ./.venv

RUN /bin/bash -c "source ./.venv/bin/activate \
    && pip install --no-cache-dir -r /app/backend.in"

CMD [".venv/bin/uvicorn", "spaceship.main:app", "--host=0.0.0.0", "--port=8000"]
