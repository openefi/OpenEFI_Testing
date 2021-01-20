FROM ubuntu:latest
ARG FIRMWARE='firmware.bin'
ENV FIRMWARE ${FIRMWARE}

RUN apt update

RUN apt install -y \
    wget \
    libx11-6
    python3

RUN cd /mnt &&\
 wget https://github.com/xpack-dev-tools/qemu-arm-xpack/releases/download/v2.8.0-11/xpack-qemu-arm-2.8.0-11-linux-x64.tar.gz &&\
 tar xvf ./xpack-qemu-arm-2.8.0-11-linux-x64.tar.gz &&\ 
 chmod +x /mnt/xpack-qemu-arm-2.8.0-11/bin/qemu-system-gnuarmeclipse &&\
 /mnt/xpack-qemu-arm-2.8.0-11/bin/qemu-system-gnuarmeclipse --version

COPY ./start.sh /mnt/start.sh
COPY ./init.py /mnt/init.py

EXPOSE 3333
ENTRYPOINT [ "/bin/bash", "-c" ,"python3 /mnt/init.py /mnt/${FIRMWARE}"  ]

# sudo docker create -name openefi_testing_container openefi_testing
# sudo docker cp ./firmware.bin openefi_testing_container:/mnt/firmware.bin
# sudo docker container start openefi_testing_container
# sudo docker container logs openefi_testing_container