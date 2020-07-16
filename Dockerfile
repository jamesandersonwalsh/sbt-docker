FROM openjdk:8

RUN addgroup --system sbt
# Create a user 'sbtuser' under 'sbt'
# - adduser --system -D -h /home/sbtuser sbtuser sbt --shell /bin/sh
RUN useradd -m sbtuser
RUN usermod -a -G sbt -d /home/sbtuser -s /bin/sh sbtuser
# Chown all the root files to the sbtuser.
RUN chown -R sbtuser:sbt /home/sbtuser /root


RUN su sbtuser
## Install SBT
RUN echo "deb http://dl.bintray.com/sbt/debian /" | tee -a /etc/apt/sources.list.d/sbt.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 642AC823
RUN apt-get update -y
RUN apt-get install sbt=1.3.10 -y
RUN sbt sbtVersion

USER sbtuser
