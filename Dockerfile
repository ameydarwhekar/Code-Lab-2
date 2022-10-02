# Amey Darwhekar - MSIS 2628 - Applied Cloud Computing - Code Lab 2

FROM python:3.10.7
USER root

RUN apt-get update && apt-get install wget
WORKDIR /AmeyDarwhekar_CodeLab2
RUN wget "https://raw.githubusercontent.com/kb22/House-Price-Predictions/master/House%20Price%20Prediction.ipynb"
COPY ./requirements.txt ./
RUN pip3 install -r requirements.txt

ENV JUPYTER_USER our_user

RUN useradd -ms /bin/bash ${JUPYTER_USER}

EXPOSE 8888

USER ${JUPYTER_USER}

USER root

CMD jupyter notebook --ip=0.0.0.0 --port 8888 --allow-root