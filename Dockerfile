FROM ubuntu:latest
LABEL maintainer="Emanuel Ramirez <eramirez2718@gmail.com>"

RUN apt-get -qq update
RUN apt-get install git sudo zsh -qq -y

RUN useradd -m -s /bin/zsh dotmaker-tester
RUN usermod -aG sudo dotmaker-tester
RUN echo 'dotmaker-tester ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

ADD . /home/dotmaker-tester/dotmaker
RUN chown -R dotmaker-tester:dotmaker-tester /home/dotmaker-tester/dotmaker

USER dotmaker-tester
ENV HOME /home/dotmaker-tester


WORKDIR /home/dotmaker-tester/dotmaker

RUN ./test-file.sh

CMD ["/bin/bash"]
