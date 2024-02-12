FROM python:3.12-bookworm

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN apt-get update && \
    apt-get install -y nodejs npm && \
    apt-get clean

WORKDIR /app

COPY requirements.txt /app/
COPY . /app/
RUN pip install --upgrade pip 
RUN pip install --no-cache-dir -r requirements.txt
RUN npm install --save-dev hardhat
RUN npm install web3
RUN pip install gunicorn

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
