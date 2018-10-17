IMAGE_NAME=choey2k5/janusgraph

stop:
	-@docker stop $(shell docker ps -aqf ancestor=$(IMAGE_NAME)) 2> /dev/null

clean: stop
	-@docker rm $(shell docker ps -aqf ancestor=$(IMAGE_NAME)) 2> /dev/null

build:
	@docker build -t $(IMAGE_NAME) .

run:
	@docker run -p 8182:8182 -dt $(IMAGE_NAME)

logs:
	@docker logs -t $(shell docker ps -aqf ancestor=$(IMAGE_NAME))

flogs:
	@docker logs -ft $(shell docker ps -aqf ancestor=$(IMAGE_NAME))

sh:
	@docker exec -it $(shell docker ps -aqf ancestor=$(IMAGE_NAME)) /bin/bash

push:
	@docker push $(IMAGE_NAME)