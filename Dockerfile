FROM ruby:2.5

RUN apt-get update
RUN apt-get install -y vim

WORKDIR /first-lang
ENV PATH="$PATH:/first-lang/bin"
COPY . .
COPY ./misc/vim/.vim /root/.vim
WORKDIR /first-lang/samples
CMD /bin/bash
