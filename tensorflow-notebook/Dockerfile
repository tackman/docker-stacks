# Copyright (c) Jupyter Development Team.
# Distributed under the terms of the Modified BSD License.
FROM tackman/scipy-notebook

LABEL maintainer="Jupyter Project <jupyter@googlegroups.com>"

USER $NB_UID

# Install Tensorflow and Keras
RUN conda install -c anaconda tensorflow-gpu && \
  conda install --quiet --yes keras && \
  conda clean -tipsy && \
  fix-permissions $CONDA_DIR && \
  fix-permissions /home/$NB_USER


# Install PyTorch
RUN conda install pytorch torchvision cudatoolkit=10.0 -c pytorch

RUN conda install -c menpo opencv3 

# Install Hy
RUN conda install pip && \
  pip install hy 

USER root
RUN fix-permissions $CONDA_DIR && \
  fix-permissions /home/$NB_USER


USER $NB_UID

RUN pip install PyQt5 && \
  mkdir ~/.jupyter

COPY jupyter_notebook_config.py /home/jovyan/.jupyter

RUN conda install -c conda-forge tqdm && \
  conda install -c conda-forge dominate
