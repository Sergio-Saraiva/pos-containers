FROM ubuntu:22.04

WORKDIR /app

RUN apt update -y && \
    apt install python3 py3-pip -y

COPY . .

RUN pip3 install poetry && \
    poetry install

EXPOSE 80

CMD streamlit run web.py
