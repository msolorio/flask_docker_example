# syntax=docker/dockerfile:1

FROM python:3.8-slim-buster

WORKDIR /app
RUN apt-get -y update && apt-get install -y gcc

COPY requirements.txt requirements.txt
RUN pip3 install --upgrade pip
RUN pip3 install -r requirements.txt

COPY . .

# running dev server
# CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]

# running prod server
CMD ["waitress-serve", "--call", "app:create_app"]
