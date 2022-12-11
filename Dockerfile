FROM ubuntu:latest

RUN apt update
RUN apt install -y emacs-nox git

ENTRYPOINT [ "emacs", "-nw" ]
