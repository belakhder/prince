FROM python:stretch

COPY . /app
WORKDIR /app
RUN pip install --upgrade pip
RUN pip install flask
RUN pip install pyjwt
RUN pip install gunicorn
RUN pip install pytest
CMD [ "virtualenv -p python3 env" ]
RUN pip install -r requirements.txt
CMD [ "source env/scripts/activate" ]
expose 8080
ENTRYPOINT ["gunicorn", "-b" ,":8080", "main:APP"]