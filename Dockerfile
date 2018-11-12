FROM node

ENV $HOSTNAME="telegram.doge.me" && \
    $API_ENPOINT=".telegram.doge.me" && \
    $API_ID="1234" && \
    $API_HASH="THIS IS THE HASH"

ADD . /opt/webogram
WORKDIR /opt/webogram

RUN sed -i "s|\"+l+\"web.telegram.org|$HOSTNAME/\"+l+\"|g" ./app/js/lib/config.js && \
    sed -i "s|\"+l+\".web.telegram.org|$API_ENDPOINT/\"+l+\"|g" ./app/js/lib/mtproto.js && \
    sed -i "s/2496/$API_ID/g"  ./app/js/lib/config.js && \
    sed -i "s/8da85b0d5bfe62527e5b244c209159c3/$API_HASH/g" ./app/js/lib/config.js
 
RUN npm install -g gulp && npm install

EXPOSE 8000

CMD ["gulp", "watch"]
