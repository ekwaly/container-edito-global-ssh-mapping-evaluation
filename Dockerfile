FROM inseefrlab/onyxia-jupyter-python

COPY --chmod=755 ./docker_init_script.sh .

COPY  ./conda-env.yml .
RUN mamba env update -n base -f ./conda-env.yml && \
    mamba clean --all --yes

USER 1000

EXPOSE 8888

CMD ["jupyter", "lab", "--no-browser", "--ip", "0.0.0.0", "--NotebookApp.token=''", "--NotebookApp.password=''"]