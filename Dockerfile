FROM openjdk:8

RUN addgroup --system sbt
# Create a user 'sbtuser' under 'sbt'
# - adduser --system -D -h /home/sbtuser sbtuser sbt --shell /bin/sh
RUN useradd -m sbtuser
RUN usermod -a -G sbt -d /home/sbtuser -s /bin/sh sbtuser
# Chown all the root files to the sbtuser.
RUN chown -R sbtuser:sbt /home/sbtuser /root

USER sbtuser
