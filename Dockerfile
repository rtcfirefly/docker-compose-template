FROM ubuntu
RUN apt-get update -y && apt-get install -y \
            build-essential \
            cmake \
            vim \
            tmux \
            git \
            wget \
            python3 \
            python3-requests \
            sudo


RUN apt-get install bash-completion -y
RUN yes | unminimize
RUN useradd -m  -s /bin/bash user
RUN usermod -aG sudo user && echo "user ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/user
RUN chmod 044 /etc/sudoers.d/user
RUN mkdir -p /home/user && chown -R user:user /home/user
RUN cp /etc/skel/.bashrc /home/user/.bashrc

ENV USER=user
ENV TERM=xterm-256color
USER user
WORKDIR /home/user
CMD [ "/bin/sleep", "infinity" ]
