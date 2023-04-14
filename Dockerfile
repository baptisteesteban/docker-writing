FROM ubuntu:latest
LABEL maintainner="Baptiste Esteban <baptiste.esteban.27@gmail.com>"

COPY apt-deps.txt .
RUN apt update && \
    /bin/bash -c 'apt install -y --no-install-recommends --fix-missing $(<apt-deps.txt)' && \
    apt clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm apt-deps.txt

RUN pip install --upgrade pip && \
    pip install Pygments

WORKDIR /workspace
RUN ["/bin/bash"]