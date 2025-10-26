FROM python:3.8 AS builder

WORKDIR /app
COPY . /app
RUN pip --no-cache-dir install -r requirements.txt

FROM python:3.8-slim
WORKDIR /app
COPY --from=builder /usr/local/lib/python3.8/site-packages /usr/local/lib/python3.8/site-packages
COPY --from=builder /usr/local/bin /usr/local/bin
COPY . .

CMD ["python3","main.py"]