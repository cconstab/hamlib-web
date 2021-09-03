FROM atsigncompany/buildimage AS buildimage
RUN \
    apt update ; \
    apt upgrade ;\
    mkdir dart ; \
    mkdir /app ;\
    cd dart ; \
    git clone https://github.com/atsign-foundation/at_tools.git ; \
    cd at_tools/at_cli/ ; \
    dart pub get ; \
    dart compile exe -o atcli bin/main.dart ; \
    cp /root/dart/at_tools/at_cli/atcli /app 
FROM scratch AS export-stage
COPY --from=buildimage /app/atcli . 
