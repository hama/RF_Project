FROM ubuntu:16.04

MAINTAINER jc

RUN mkdir -p /home

WORKDIR /home

#echo "205.251.203.171 deb.nodesource.com" >> /etc/hosts \
RUN echo && cd /home  \
    && apt-get update \
    && apt-get install -y python2.7 curl git vim\
    && curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py \
    && python2.7 get-pip.py \
    && pip install oss2 \
    && pip install robotframework \
    && pip install pymysql requests \
    && pip install  --pre --upgrade robotframework-selenium2library \
    && apt-get install -y wget curl libxss1 libappindicator1 libindicator7 fonts-liberation  libasound2 libnspr4  libnss3   lsb-release  xdg-utils \
    && wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
    && dpkg -i google-chrome*.deb \
    && apt-get -y install fontconfig xfonts-utils \
    && apt-get install -y fonts-droid-fallback ttf-wqy-zenhei ttf-wqy-microhei fonts-arphic-ukai fonts-arphic-uming \
    && apt-get install -f

COPY /chromedriver /usr/local/bin

# ENTRYPOINT
# CMD

CMD ["bash", "-c", "sleep 100000000"]
