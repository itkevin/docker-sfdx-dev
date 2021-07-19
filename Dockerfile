FROM salesforce/salesforcedx:latest-full

RUN sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.1/zsh-in-docker.sh)" -- \
    -t agnoster \
    -p sfdx \
    -p git \
    -p https://github.com/zsh-users/zsh-autosuggestions \
    -p https://github.com/zsh-users/zsh-completions

RUN apt-get -y install python3-pip python-pygments
RUN pip3 install yq
RUN sfdx update
RUN echo y | sfdx plugins:install sfdx-git-delta
