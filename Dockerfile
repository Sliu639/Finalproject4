FROM rocker/tidyverse:4.5.1


RUN mkdir /heart_project
WORKDIR /heart_project


RUN mkdir code
RUN mkdir output
RUN mkdir data
RUN mkdir report


COPY code code
COPY data data
COPY output output
COPY report report


COPY Makefile .


COPY renv.lock .
RUN mkdir renv
COPY renv/activate.R renv
COPY renv/settings.json renv


RUN R -q -e "install.packages('renv')"
RUN Rscript -e "renv::restore(prompt = FALSE)"


CMD make

