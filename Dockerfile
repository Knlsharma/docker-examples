# We Use an official Python runtime as a parent image
FROM python:3.6

# The enviroment variable ensures that the python output is set straight
# to the terminal with out buffering it first
ENV PYTHONUNBUFFERED 1
ENV PYTHONDONTWRITEBYTECODE 1
ENV PORT 8888


# Getting requirements
COPY ./requirements.txt /requirements.txt

# Install any needed packages specified in requirements.txt
RUN pip install -r requirements.txt

#directory for getting o/p image
RUN mkdir /app
WORKDIR /app
COPY ./app .

WORKDIR /app

# Add scope to our image
# RUN adduser -D user
# USER user

EXPOSE 8888

CMD gunicorn locallibrary.wsgi:application --bind 0.0.0.0:$PORT


# docker build .
