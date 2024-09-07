file ./build/nginx


set follow-fork-mode child

b main

b ngx_ssl_init

b ngx_process_events_and_timers

b ngx_http_init_connection
run -c /home/wanghan/Workspace/DASICS_ICT/DASICS-DEMO/demo-nginx/nginx-bin-x86/conf/nginx.conf

b ssl3_read_bytes

c