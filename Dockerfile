FROM centos:centos7

USER root

COPY /google-chrome-stable-65.0.3325.181-1pclos2018.x86_64.rpm /opt/google-chrome-stable-65.0.3325.181-1pclos2018.x86_64.rpm
COPY /start.sh /opt

RUN yum --nogpgcheck localinstall -y /opt/google-chrome-stable-65.0.3325.181-1pclos2018.x86_64.rpm \
    && chmod 777 /opt/start.sh \
    && yum install -y pango libXcomposite libXcursor libXdamage libXext \
       libXi libXtst cups-libs libXScrnSaver libXrandr GConf2 alsa-lib atk gtk3 \
       ipa-gothic-fonts xorg-x11-fonts-100dpi xorg-x11-fonts-75dpi xorg-x11-utils \
       xorg-x11-fonts-cyrillic xorg-x11-fonts-Type1 xorg-x11-fonts-misc

CMD [ "/opt/start.sh" ]

