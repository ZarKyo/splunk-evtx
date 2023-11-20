FROM python:slim
WORKDIR /
RUN apt update -y && apt install git -y
RUN git clone https://github.com/whikernel/evtx2splunk.git
WORKDIR /evtx2splunk
RUN pip install -r requirements.txt
ARG SPLUNK_URL
ARG SPLUNK_PORT
ARG SPLUNK_MPORT
ARG SPLUNK_SSL
ARG SPLUNK_USER
ARG SPLUNK_PASS
RUN echo "SPLUNK_URL = ${SPLUNK_URL}" >> .env
RUN echo "SPLUNK_PORT = ${SPLUNK_PORT}" >> .env
RUN echo "SPLUNK_MPORT = ${SPLUNK_MPORT}" >> .env
RUN echo "SPLUNK_SSL = ${SPLUNK_SSL}" >> .env
RUN echo "SPLUNK_USER = ${SPLUNK_USER}" >> .env
RUN echo "SPLUNK_PASS = ${SPLUNK_PASS}" >> .env
CMD ["tail", "-f", "/dev/null"]
