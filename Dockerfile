FROM python:3.7-slim
WORKDIR /app
COPY ./api_yamdb/requirements.txt .
RUN pip3 install -r requirements.txt --no-cache-dir
COPY ./api_yamdb/. .
COPY fixtures.json .
CMD ["gunicorn", "--bind", "0:8000", "api_yamdb.wsgi:application"]