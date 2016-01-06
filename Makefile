SHELL := $(shell echo $$SHELL)

build:
	docker build -t swift2byexample --rm .

run: build
	docker run -i -t -P --name swift2byexample --env-file env -p 8888:8888 swift2byexample /bin/zsh -c 'cd; zsh -i'
	##docker run --name swift2byexample -p 8888:8888 -d swift2byexample /bin/sh  -c "while true; do ping 8.8.8.8; done"
	#docker run -i -t -P -p 8888:8888  swift2byexample
attach:
#	docker exec -it -t `docker ps -q` /bin/zsh -c 'cd; zsh -i'

getip:
#	bash -c "CID=$(docker ps | grep swift2byexample | awk '{print $$1}'); echo ${CID}"
	./getip.sh

logs:
	docker logs `docker ps -qa`

clean:
	docker stop `docker ps -aq`; docker rm `docker ps --no-trunc -aq`

rmcontainers:
	docker rm $(docker ps -a -q)

srmimages:
	docker rmi $(docker images -q)
