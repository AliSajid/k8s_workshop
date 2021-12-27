FROM python:3
ENV PYTHONUNBUFFERED=1

RUN mkdir /app
WORKDIR /app

COPY src/ /app/
COPY pyproject.toml /app

ENV PYTHONPATH=${PYTHONPATH}:${PWD}

RUN pip3 install poetry
RUN poetry config virtualenvs.create false
RUN poetry install --no-dev

EXPOSE 5000
CMD ["python", "app.py"]