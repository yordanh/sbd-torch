FROM pytorch/pytorch:nightly-runtime-cuda9.2-cudnn7

RUN apt-get update && apt-get install -y wget vim htop tmux sudo libgtk2.0-dev

WORKDIR /sbd_torch

COPY . .

RUN pip install -U -r requirements.txt

RUN pip install torch==1.4.0+cu92 torchvision==0.5.0+cu92 -f https://download.pytorch.org/whl/torch_stable.html

RUN useradd -m user && \
    echo user:user | chpasswd && \
    adduser user sudo

RUN chown user /sbd_torch -c --recursive .

USER user
