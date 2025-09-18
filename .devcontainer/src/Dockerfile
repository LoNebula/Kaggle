FROM jupyter/datascience-notebook:x86_64-ubuntu-22.04

WORKDIR /home/jovyan/work

USER root
RUN apt-get update && apt-get install -y \
    software-properties-common \
    python3.10 \
    python3.10-venv \
    python3.10-distutils \
    curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.10 1 && \
    update-alternatives --set python3 /usr/bin/python3.10

RUN curl -sS https://bootstrap.pypa.io/get-pip.py | python3.10

USER jovyan

COPY requirements.txt ${PWD}
RUN pip install --no-cache-dir -r requirements.txt