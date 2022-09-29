FROM dhrubajyotichakraborty/ci-base-img:latest
WORKDIR /usr/src/app
RUN pip install --no-cache-dir pipenv==2020.11.15 && pipenv install
COPY app.py .
CMD [ "pipenv", "run", "python", "-m", "flask", "run", "--host=0.0.0.0" ]
