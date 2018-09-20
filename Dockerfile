FROM arm32v7/debian

RUN apt-get update
RUN apt-get install -my wget gnupg
RUN wget http://repo.mosquitto.org/debian/mosquitto-repo.gpg.key 
RUN apt-key add mosquitto-repo.gpg.key
RUN wget -P /etc/apt/sources.list.d/ http://repo.mosquitto.org/debian/mosquitto-jessie.list
RUN apt-get install -y apt-transport-https
# Required for old libssl which mosquitto depends on
# see https://github.com/eclipse/mosquitto/issues/529#issuecomment-356787605
RUN echo "deb http://archive.raspbian.org/raspbian jessie main contrib non-free" >> /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y mosquitto --allow-unauthenticated
RUN apt-get install -y mosquitto-clients --allow-unauthenticated
