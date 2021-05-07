# pull official base image
FROM python:3.9.1-slim-buster

# set working directory
WORKDIR /usr/src/app

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1


# install dependencies
RUN pip install pip==21.0.1
COPY ./requirements.txt .
RUN pip install -r requirements.txt

# add app
COPY . .

# add and run as non-root user
RUN adduser --disabled-password user
USER user
