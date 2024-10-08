FROM ubuntu:22.04

WORKDIR /app

RUN apt update && \
    apt install python3 python3-pip -y

COPY . .

RUN pip3 install poetry 

RUN poetry config --local virtualenvs.in-project true && poetry install

RUN source .venv/bin/activate

CMD ["streamlit" "run" "web.py"]