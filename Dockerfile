FROM inseefrlab/onyxia-jupyter-python

COPY  ./conda-env.yml .
RUN mamba env update -n base -f ./conda-env.yml && \
    mamba clean --all --yes && \
    rm conda-env.yml

USER 1000

CMD []
