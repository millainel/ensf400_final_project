# # # # # # # FROM jenkins/jenkins:alpine

# # # # # # # # Switch to root user to install dependencies
# # # # # # # USER root

# # # # # # # # Install Docker inside Jenkins container
# # # # # # # RUN apk add --update docker openrc

# # # # # # FROM jenkins/jenkins:alpine

# # # # # # # Switch to root user to install dependencies
# # # # # # USER root

# # # # # # # Install Docker inside Jenkins container
# # # # # # RUN apk add --update docker openrc

# # # # # # # Install Python 3, pip, and pipenv
# # # # # # RUN apk add --no-cache python3 py3-pip \
# # # # # #     && pip3 install --upgrade pip \
# # # # # #     && pip3 install pipenv


# # # # # FROM jenkins/jenkins:alpine

# # # # # # Switch to root user to install dependencies
# # # # # USER root

# # # # # # Install Docker inside Jenkins container
# # # # # RUN apk add --update docker openrc \
# # # # #     && apk add --no-cache python3 py3-pip \
# # # # #     && pip3 install --upgrade pip \
# # # # #     && pip3 install pipenv

# # # # # # Set default user back to Jenkins user
# # # # # USER jenkins

# # # # # # Ensure Jenkins' user can access Docker socket
# # # # # RUN addgroup jenkins docker

# # # # FROM jenkins/jenkins:alpine

# # # # # Switch to root user to install dependencies
# # # # USER root

# # # # # Install Docker, Python3, pip and pipenv
# # # # RUN apk add --no-cache \
# # # #     python3 \
# # # #     py3-pip \
# # # #     docker \
# # # #     openrc \
# # # #     && pip3 install --upgrade pip \
# # # #     && pip3 install pipenv

# # # # # Switch back to the jenkins user
# # # # USER jenkins


# # # FROM jenkins/jenkins:alpine

# # # USER root

# # # RUN apk add --no-cache \
# # #     python3 \
# # #     py3-pip \
# # #     py3-pipenv \
# # #     docker \
# # #     openrc

# # # USER jenkins

# # FROM jenkins/jenkins:alpine

# # USER root

# # # Install system packages
# # RUN apk add --no-cache \
# #     python3 \
# #     py3-pip \
# #     docker \
# #     openrc

# # # Install pipx and pipenv (with override)
# # RUN python3 -m pip install --break-system-packages pipx && \
# #     /root/.local/bin/pipx ensurepath && \
# #     /root/.local/bin/pipx install pipenv

# # # Make sure pipx and pipenv are in the path
# # ENV PATH="/root/.local/bin:$PATH"

# # USER jenkins

# FROM jenkins/jenkins:lts


# USER root

# # Install system packages
# RUN apk add --no-cache \
#     python3 \
#     py3-pip \
#     docker \
#     openrc

# # Fix: create pipx install location and update PATH
# ENV PATH="/root/.local/bin:$PATH"

# RUN mkdir -p /root/.local/bin && \
#     python3 -m pip install --break-system-packages pipx && \
#     pipx install pipenv

# USER jenkins


# FROM jenkins/jenkins:lts

# USER root

# # Install system packages
# RUN apt-get update && apt-get install -y \
#     python3 \
#     python3-pip \
#     docker.io \
#     && apt-get clean

# # Fix: create pipx install location and update PATH
# ENV PATH="/root/.local/bin:$PATH"

# RUN mkdir -p /root/.local/bin && \
#     python3 -m pip install --break-system-packages pipx && \
#     pipx install pipenv

# USER jenkins

FROM jenkins/jenkins:lts

USER root

# Install system packages
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-venv \
    docker.io \
    && apt-get clean

# Fix: create pipx install location and update PATH
ENV PATH="/root/.local/bin:$PATH"

RUN mkdir -p /root/.local/bin && \
    python3 -m pip install --break-system-packages pipx && \
    pipx install pipenv

USER jenkins

