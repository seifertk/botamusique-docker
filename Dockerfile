FROM python:3-alpine

WORKDIR /app

RUN apk add --no-cache git ffmpeg-dev zlib-dev jpeg-dev gcc musl-dev
RUN git clone --recurse-submodules https://github.com/seifertk/botamusique.git .
RUN python3 -m venv venv
RUN venv/bin/pip install wheel opuslib protobuf
RUN venv/bin/pip install -r requirements.txt

FROM python:3-alpine
WORKDIR /app
COPY --from=0 /app .
RUN apk add --no-cache gcc opus-dev libmagic ffmpeg
ENTRYPOINT ["/app/venv/bin/python", "/app/mumbleBot.py"]
