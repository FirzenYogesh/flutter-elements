FROM ubuntu:latest

RUN apt-get update && apt-get upgrade -y && apt-get -y install git curl unzip zsh wget bsdmainutils

COPY dependency-install.zsh .
RUN chmod +x dependency-install.zsh

RUN wget -O ~/.zshrc https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/templates/zshrc.zsh-template

RUN chsh -s /usr/bin/zsh

RUN curl -o- https://raw.githubusercontent.com/FirzenYogesh/development-kit/main/install.sh | zsh

RUN zsh dependency-install.zsh

CMD [ "zsh" ]