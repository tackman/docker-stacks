# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
FROM tackman/scipy-notebook

LABEL maintainer="Jupyter Project <jupyter@googlegroups.com>"

USER root

RUN apt-get -y install cuda-command-line-tools-9-0

USER $NB_UID

RUN export LD_LIBRARY_PATH=${LD_LIBRARY_PATH:+${LD_LIBRARY_PATH}:}/usr/local/cuda/extras/CUPTI/lib64 


# Install Tensorflow
RUN conda install --quiet --yes \
    'tensorflow-gpu' \
    'keras' && \
    conda clean -tipsy && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER

RUN conda install numpy pyyaml scipy ipython mkl mkl-include && \ 
    conda install -c pytorch magma-cuda90 && conda clean -ya

RUN conda install torchvision -c pytorch
RUN conda install -c menpo opencv3 
