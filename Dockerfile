FROM python:3.9-slim-buster

RUN apt-get update && apt-get install -y git jq
WORKDIR /app
COPY . .
RUN pip install --no-cache-dir -r requirements.txt

RUN bash run.sh

# Set the command to start the bots
CMD flask run -h 0.0.0.0 -p 10000 & python3 ghost.py & python3 worker.py
