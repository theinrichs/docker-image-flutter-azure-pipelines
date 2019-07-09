FROM cirrusci/flutter:v1.5.4-hotfix.2-web 

RUN echo "Adding vsts_azpcontainer user and group" \
    && sudo useradd --system --uid 1001 --shell /bin/bash --create-home vsts_azpcontainer \
    && sudo adduser vsts_azpcontainer sudo

ENV HOME /home/vsts_azpcontainer

USER vsts_azpcontainer
