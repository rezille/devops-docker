# use alpine base
FROM alpine:latest

# variables
ENV PORT 8000
ENV APPDIR /app
ENV APP hello.py
ENV REQFILE requirements.txt

# install
RUN apk add --no-cache python py-pip
COPY $REQFILE ./$REQFILE
RUN pip install -r $REQFILE

# set directory
VOLUME $APPDIR
WORKDIR $APPDIR

# allow port
EXPOSE $PORT

# run app
CMD python $APP