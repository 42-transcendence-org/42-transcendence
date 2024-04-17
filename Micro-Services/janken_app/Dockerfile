FROM python:3.12-bookworm

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /app

COPY requirements.txt /app/
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

COPY script.sh /app/
RUN chmod +x /app/script.sh

EXPOSE 8000

CMD ["sh", "/app/script.sh"]