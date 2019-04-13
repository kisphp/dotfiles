FROM debian:9

RUN apt-get update \
&& apt-get install -y zsh bc vim \
&& chsh -s /bin/zsh

COPY .bashrc /root/.bashrc
COPY .zshrc /root/.zshrc

COPY . /root/.dotfiles

