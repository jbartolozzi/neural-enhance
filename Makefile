SHELL:=/bin/bash

dockerfile := "docker-gpu.df"
tag_name := "jhb_enhance"
build:
	USER_ID=$(UID) docker build -f ./$(dockerfile) -t $(tag_name) ./
shell:
	docker run --gpus all -v /mnt/data:/mnt/data -w /data --rm -it -v `pwd`:/data -t $(tag_name) /bin/bash
