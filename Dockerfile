FROM r-base

WORKDIR /home/depnetr

RUN apt-get update \ 
    && apt-get install -y wget \
         libssl-dev \
         libcurl4-openssl-dev \
         libxml2-dev \
         libxslt1-dev 

RUN useradd -G staff depnetr
USER depnetr

RUN Rscript -e 'install.packages(c("devtools"), dependencies = TRUE)'

COPY . .

RUN R -e 'devtools::install_dev_deps(); devtools::install()'

CMD ["bash"]
