FROM python:3.7.3-alpine3.9 as base

RUN mkdir -p /app/
RUN mkdir -p /app/SmartSteelPyFlaskCSV/
RUN mkdir -p /app/SmartSteelPyFlaskCSV/app/
RUN mkdir -p /app/SmartSteelPyFlaskCSV/batch/
RUN mkdir -p /app/SmartSteelPyFlaskCSV/resource/

WORKDIR /app/SmartSteelPyFlaskCSV/app/

COPY ./requirements_flask.txt /app/SmartSteelPyFlaskCSV/app/requirements_flask.txt
RUN pip install --upgrade pip
RUN pip install -r requirements_flask.txt
COPY ./app/ /app/SmartSteelPyFlaskCSV/app/
COPY ./batch/ /app/SmartSteelPyFlaskCSV/batch/
COPY ./resource/ /app/SmartSteelPyFlaskCSV/resource/

ENV FLASK_APP=smart_steel_app.py

CMD flask run -h 0.0.0.0 -p 5000