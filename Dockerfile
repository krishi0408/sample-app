FROM dhrubajyotichakraborty/ci-base-img:latest
WORKDIR /py-sample-proj
ADD . /py-sample-proj
RUN pip install -r requirements.txt
CMD ["python" , "app.py"]
