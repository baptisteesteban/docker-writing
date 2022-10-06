FROM ubuntu:jammy
LABEL maintainner="Baptiste Esteban <baptiste.esteban.27@gmail.com>"

COPY apt-deps.txt .
RUN apt update && \
    /bin/bash -c 'apt install -y --no-install-recommends $(<apt-deps.txt)' && \
    apt clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm apt-deps.txt

WORKDIR /workspace
RUN ["/bin/bash"]