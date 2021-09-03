FROM atsigncompany/buildimage AS buildimage
RUN \
    mkdir dart ; \
    mkdir /app ;\
    cd dart ; \
    git init ; \
    git remote add -f origin https://github.com/atsign-foundation/at_tools.git ; \
    echo at_cli >> .git/info/sparse-checkout ; \
    git pull origin master ; \
    cd at_cli/ ; \
    dart pub get ; \
    dart compile exe -o atcli bin/main.dart ; \
    cp /root/dart/at_cli/atcli /app 
FROM scratch AS export-stage
COPY --from=buildimage /app/atcli . 