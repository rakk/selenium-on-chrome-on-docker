FROM centos:centos7

USER root

# copy local:
COPY /packages /opt

# google chrome
RUN yum --nogpgcheck localinstall -y /opt/google-chrome-stable-65.0.3325.181-1pclos2018.x86_64.rpm \
    && yum install -y pango libXcomposite libXcursor libXdamage libXext \
       libXi libXtst cups-libs libXScrnSaver libXrandr GConf2 alsa-lib atk gtk3 \
       ipa-gothic-fonts xorg-x11-fonts-100dpi xorg-x11-fonts-75dpi xorg-x11-utils \
       xorg-x11-fonts-cyrillic xorg-x11-fonts-Type1 xorg-x11-fonts-misc


# install java:
RUN yum install -y java-1.8.0-openjdk-devel

# install node
RUN curl -sL https://rpm.nodesource.com/setup_8.x | bash -
RUN yum -y install nodejs

RUN cd /opt && npm install selenium-webdriver && npm install chromedriver

COPY /files-to-add /opt

RUN chmod 777 /opt/start.sh \
    && chmod 777 /opt/selenium-server-standalone-2.41.0.jar \
    && chmod 777 /opt/chromedriver

CMD [ "/opt/start.sh" ]

