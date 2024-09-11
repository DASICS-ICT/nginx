#!/bin/sh
./auto/configure\
 --prefix=$PWD/../nginx-bin\
 --builddir=$PWD/build\
 --user=nginx\
 --group=nginx\
 --with-file-aio\
 --with-ipv6\
 --with-cc=riscv64-unknown-linux-gnu-gcc\
 --with-cpp=riscv64-unknown-linux-gnu-g++\
 --with-http_ssl_module\
 --with-http_v2_module\
 --with-http_realip_module\
 --with-http_addition_module\
 --with-http_sub_module\
 --with-http_dav_module\
 --with-http_flv_module\
 --with-http_mp4_module\
 --with-http_gunzip_module\
 --with-http_gzip_static_module\
 --with-http_random_index_module\
 --with-http_secure_link_module\
 --with-http_degradation_module\
 --with-http_slice_module\
 --with-http_auth_request_module\
 --with-mail=dynamic\
 --with-openssl-opt=\
 --with-openssl=$PWD/../openssl\
 --with-pcre\
 --with-pcre-jit\
 --with-stream=dynamic\
 --with-stream_ssl_module\
 --with-mail_ssl_module\
 --with-debug\
 --error-log-path=/var/log/nginx/error.log\
 --http-log-path=/var/log/nginx/access.log\
 --http-client-body-temp-path=/var/lib/nginx/tmp/client_body\
 --http-fastcgi-temp-path=/var/lib/nginx/tmp/fastcgi\
 --http-proxy-temp-path=/var/lib/nginx/tmp/proxy\
 --http-scgi-temp-path=/var/lib/nginx/tmp/scgi\
 --http-uwsgi-temp-path=/var/lib/nginx/tmp/uwsgi\
 --pid-path=/run/nginx.pid\
 --lock-path=/run/lock/subsys/nginx

make -C LibDASICS clean
make -C LibDASICS

make -j`nproc` && make install

riscv64-unknown-linux-gnu-objdump -d ./build/nginx > nginx.txt

scp -P 12055 -r ../nginx-bin/sbin/nginx wanghan@localhost:
