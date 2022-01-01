FROM python:3
ENV PYTHONUNBUFFERED=1
RUN adduser pyuser

RUN mkdir /app
WORKDIR /app

COPY src/ /app/
COPY pyproject.toml /app

RUN pip3 install poetry
RUN poetry config virtualenvs.create false
RUN poetry install --no-dev

RUN chmod +x app.py
RUN chown -R pyuser:pyuser /app
USER pyuser

EXPOSE 5000
CMD ["python", "./app.py"]