FROM inovex/gitlab-ci-android:latest

RUN apt-get update

RUN apt-get install sudo

RUN yes | /sdk/tools/bin/sdkmanager --licenses

RUN useradd -m -u 1001 vsts_azpcontainer

RUN su -c "echo '%vsts_azpcontainer ALL=(ALL:ALL) NOPASSWD:ALL' >> /etc/sudoers"

USER vsts_azpcontainer

RUN sudo apt-get install -y nodejs
RUN sudo apt-get install -y npm

RUN sudo npm install -g fvm --unsafe-perm

RUN sudo chmod 777 /sdk/tools/bin/sdkmanager

RUN sudo fvm stable
RUN fvm 1.7.8+hotfix.3

RUN sudo chmod -R 777 /home/vsts_azpcontainer/

USER root
