FROM python:3.12-slim

# uv, copied from its official image
COPY --from=ghcr.io/astral-sh/uv:latest /uv /usr/local/bin/uv

WORKDIR /app

# 1. Dependencies first. This layer is rebuilt only when the lock file changes.
COPY pyproject.toml uv.lock ./
RUN uv sync --frozen --no-dev --no-install-project

# 2. Your code last, because it changes most often.
COPY definitions.py ./

# Use the virtual environment that uv created
ENV PATH="/app/.venv/bin:$PATH"
