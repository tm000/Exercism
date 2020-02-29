FROM openjdk:latest

WORKDIR /root

RUN set -eux \
    && yum install -y \
         wget \
         unzip \
    && mkdir /opt/gradle \
    && wget https://downloads.gradle-dn.com/distributions/gradle-6.2.1-bin.zip \
    && unzip -d /opt/gradle gradle-6.2.1-bin.zip \
    && rm gradle-6.2.1-bin.zip
RUN wget https://github.com/exercism/cli/releases/download/v3.0.13/exercism-3.0.13-linux-x86_64.tar.gz \
    && mkdir /opt/exercism \
    && tar -zxvf exercism-3.0.13-linux-x86_64.tar.gz --directory=/opt/exercism \
    && rm exercism-3.0.13-linux-x86_64.tar.gz
RUN rpm -Uvh https://packages.microsoft.com/config/centos/7/packages-microsoft-prod.rpm \
    && yum install -y dotnet-sdk-3.1
RUN wget https://codeload.github.com/sstephenson/bats/zip/master \
    && unzip master \
    && rm master \
    && mv bats-master /opt/ \
    && /opt/bats-master/install.sh /usr/local

ENV PATH $PATH:/opt/gradle/gradle-6.2.1/bin:/opt/exercism:/usr/share/dotnet

VOLUME /root/exercism

CMD ["/bin/bash"]
