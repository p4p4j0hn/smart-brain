FROM ghcr.io/p4p4j0hn/smart-brain-base:latest

RUN sudo mkdir -p /etc/ssh/sshd_config.d/ \
  && echo "StreamLocalBindUnlink Yes" | sudo tee /etc/ssh/sshd_config.d/90_localbindunlink.conf

# Mount for docker-in-docker 
VOLUME [ "/var/lib/docker" ]

# Fire Docker/Moby script if needed
ENTRYPOINT [ "/usr/local/share/docker-init.sh", "/usr/local/share/ssh-init.sh"]

