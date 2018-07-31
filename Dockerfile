FROM ubuntu:16.04

RUN apt-get update && \
    apt-get -qq --no-install-recommends install \
        ca-certificates \
        libpcre16-3 \
        libxcb1 \
        wget && \
    rm -r /var/lib/apt/lists/*

RUN wget --content-disposition https://minergate.com/download/ubuntu-cli && \
    dpkg -i *.deb && \
    rm *.deb

ENTRYPOINT ["minergate-cli"]
CMD ["--user", "miltonmc@gmail.com", "--xmr"]
