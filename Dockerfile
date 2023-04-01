FROM python:3.11-slim

RUN pip install poetry

WORKDIR /app

COPY pyproject.toml ./

RUN poetry config virtualenvs.create false \
    && poetry install --no-interaction --no-ansi

COPY app .

EXPOSE 8501

CMD ["streamlit", "run", "main.py", "--server.port", "8501"]
