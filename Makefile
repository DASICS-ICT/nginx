
default:	build

clean:
	rm -rf Makefile /home/wanghan/Workspace/DASICS_ICT/DASICS-DEMO/demo-nginx/nginx/build

.PHONY:	default clean

build:
	$(MAKE) -f /home/wanghan/Workspace/DASICS_ICT/DASICS-DEMO/demo-nginx/nginx/build/Makefile

install:
	$(MAKE) -f /home/wanghan/Workspace/DASICS_ICT/DASICS-DEMO/demo-nginx/nginx/build/Makefile install

modules:
	$(MAKE) -f /home/wanghan/Workspace/DASICS_ICT/DASICS-DEMO/demo-nginx/nginx/build/Makefile modules

upgrade:
	/home/wanghan/Workspace/DASICS_ICT/DASICS-DEMO/demo-nginx/nginx/../nginx-bin/sbin/nginx -t

	kill -USR2 `cat /run/nginx.pid`
	sleep 1
	test -f /run/nginx.pid.oldbin

	kill -QUIT `cat /run/nginx.pid.oldbin`

.PHONY:	build install modules upgrade
