FROM nvidia/cuda:11.0-base
RUN apt-get update && apt-get install -y --no-install-recommends \
    cuda-cudart-11-0 \
    && rm -rf /var/lib/apt/lists/*

CMD nvidia-smi

FROM apache/airflow:2.6.1-python3.10
USER root 
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
         git zip unzip wget jq\
  && apt-get autoremove -yqq --purge \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
# && unzip awscliv2.zip \
# && ./aws/install

# COPY aws_configure /home/airflow/.aws
USER airflow
ENV CONDA_DIR=/home/airflow/conda
RUN wget \
    https://repo.anaconda.com/miniconda/Miniconda3-py310_23.3.1-0-Linux-x86_64.sh \
    && bash Miniconda3-py310_23.3.1-0-Linux-x86_64.sh -b -p ${CONDA_DIR} \
    && rm -f Miniconda3-py310_23.3.1-0-Linux-x86_64.sh

ENV PATH=$CONDA_DIR/bin:$PATH
RUN conda init bash
RUN conda --version
RUN pip install docker
USER root
# RUN distribution=$(. /etc/os-release;echo $ID$VERSION_ID) \
#       && curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg \
#       && curl -s -L https://nvidia.github.io/libnvidia-container/experimental/$distribution/libnvidia-container.list | \
#          sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
#          sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list
# RUN apt-get update

# RUN apt-get install -y nvidia-container-toolkit
# RUN nvidia-ctk runtime configure --runtime=docker
# RUN apt-get install -y nvidia-docker2
# RUN systemctl daemon-reload
# RUN systemctl restart docker
# RUN docker run --rm --runtime=nvidia --gpus all nvidia/cuda:11.6.2-base-ubuntu20.04 nvidia-smi
# FROM nvidia/cuda:10.2-base
# CMD nvidia-smi
RUN chmod -R a+rwX /home/airflow/
USER airflow