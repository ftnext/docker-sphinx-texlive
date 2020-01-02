FROM ubuntu:16.04

ENV LANG C.UTF-8
ENV TZ Asia/Tokyo
ENV PYTHONIOENCODING "utf-8"
ENV PYTHONUNBUFFERED 1

RUN apt-get update && apt-get install -y -q software-properties-common
RUN add-apt-repository ppa:jonathonf/python-3.6

RUN apt-get update \
  && apt-get install -y -q \
      python3.6 python3.6-dev python3-pip make curl \
      build-essential libjpeg8-dev zlib1g-dev libtiff5-dev \
      libfreetype6-dev fonts-takao fonts-vlgothic texlive-full \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && cd /usr/local/bin \
  && ln -s /usr/bin/python3.6 python

RUN mkdir /docs/
WORKDIR /docs/
COPY requirements.txt /docs/
RUN python -m pip install -r requirements.txt

CMD make latexpdfja
