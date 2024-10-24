FROM python:3.12.7-slim-bookworm
COPY ./requirements.txt /app/requirements.txt
WORKDIR /app
RUN pip3 install -r requirements.txt
COPY . /app
EXPOSE 5000
ENTRYPOINT ["python3", "-m", "flask", "run", "--host=0.0.0.0"]
