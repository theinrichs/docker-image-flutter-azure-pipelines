FROM inovex/gitlab-ci-android:latest

RUN apt-get update && apt-get install -y \
    sudo \
    nodejs \
    npm

RUN yes | /sdk/tools/bin/sdkmanager --licenses

RUN npm install -g fvm --unsafe-perm && \
    chmod 777 /sdk/tools/bin/sdkmanager && \
    fvm stable && \
    fvm 1.7.8+hotfix.3

RUN useradd -m -u 1001 vsts_azpcontainer && \
    su -c "echo '%vsts_azpcontainer ALL=(ALL:ALL) NOPASSWD:ALL' >> /etc/sudoers" && \
    chmod -R 777 /home/vsts_azpcontainer/