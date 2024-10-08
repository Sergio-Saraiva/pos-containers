FROM ubuntu:22.04

WORKDIR /app

RUN apt update && \
    apt install python3 python3-pip -y

COPY . .

RUN pip3 install poetry 

RUN poetry config --local virtualenvs.in-project true

SHELL ["/bin/bash", "-c"] 

RUN source .venv/bin/activate

RUN pip install streamlit python-docx openpyxl

CMD ["streamlit" "run" "web.py"]