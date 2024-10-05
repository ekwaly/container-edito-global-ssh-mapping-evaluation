FROM inseefrlab/onyxia-jupyter-python

COPY  ./conda-env.yml .
RUN mamba env update -n base -f ./conda-env.yml && \
    mamba clean --all --yes

USER 1000

CMD ["echo", "Override this command with k8s options or args CLI"]