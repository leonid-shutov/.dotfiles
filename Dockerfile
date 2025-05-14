FROM fedora:latest

RUN dnf -y install git

COPY . /root/.dotfiles

CMD ["/bin/bash"]
