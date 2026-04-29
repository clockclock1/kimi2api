FROM python:3.11-slim

WORKDIR /app

COPY pyproject.toml .
COPY uv.lock .
COPY main.py .
COPY kimi2api/ kimi2api/

RUN pip install --no-cache-dir uv && \
    uv sync --no-dev && \
    rm -rf /root/.cache

EXPOSE 8000

CMD ["uv", "run", "main.py"]
