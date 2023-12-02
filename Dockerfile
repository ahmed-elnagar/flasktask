FROM python:3.8-slim-buster
WORKDIR /flask-app
COPY req.txt req.txt
COPY app.py app.py 
RUN pip install -r req.txt
EXPOSE 50100
CMD [ "python3", "app.py"]
