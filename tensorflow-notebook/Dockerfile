# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
FROM tackman/scipy-notebook

LABEL maintainer="Jupyter Project <jupyter@googlegroups.com>"

USER root

RUN apt-get -y install cuda-command-line-tools-9-0

USER $NB_UID


RUN export LD_LIBRARY_PATH=${LD_LIBRARY_PATH:+${LD_LIBRARY_PATH}:}/usr/local/cuda/extras/CUPTI/lib64 


RUN conda install --quiet --yes keras && \
  conda clean -tipsy && \
  fix-permissions $CONDA_DIR && \
  fix-permissions /home/$NB_USER

RUN conda install numpy pyyaml scipy ipython mkl mkl-include
RUN conda install -c pytorch magma-cuda90 && conda clean -ya

RUN conda install torchvision -c pytorch
RUN conda install -c menpo opencv3 

# Install Tensorflow
RUN conda install -c anaconda tensorflow-gpu


RUN conda install pip

RUN pip install hy

RUN pip install git+https://github.com/ekaschalk/jedhy.git &&  \
  pip install git+https://github.com/Calysto/calysto_hy.git


USER root
RUN python -m calysto_hy install


RUN  fix-permissions $CONDA_DIR && \
  fix-permissions /home/$NB_USER


USER $NB_UID

RUN pip install PyQt5
