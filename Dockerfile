FROM python:3.6

WORKDIR /opt

RUN apt update

RUN apt install nano -y

RUN apt install git -y && git clone https://github.com/subzero355/Nerd-Storage.git

#WORKDIR /opt/nerd-storage

#COPY cli /opt/nerd-storage/cli

#COPY src /opt/nerd-storage/src 

RUN pip install Flask && pip install Flask-Login && pip install Jinja2

#RUN pip install  Nerd-Storage

#COPY ./config.py /root/.local/lib/python3.6/site-packages/NERD/

COPY ./password.sh /opt/Nerd-Storage/
COPY ./start.sh /opt/Nerd-Storage/
COPY ./src/NERD/__main__.py /opt/Nerd-Storage/src/
COPY ./hash.txt /opt/Nerd-Storage/src/NERD/hash/
#ENV PATH="/root/.local/bin:${PATH}"

#COPY ./hash.txt /root/.local/lib/python3.6/site-packages/NERD/hash/

EXPOSE 5000

#ENTRYPOINT ["nerdstorage"]
CMD ["bash", "/opt/Nerd-Storage/start.sh"]
