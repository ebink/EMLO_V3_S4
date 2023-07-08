#makefile to work with dockerfile

#vars
USERNAME = default
PROJECT = emlop
TAG = assignment4-v1

#setup make commands
help:
	@echo "Makefile supported commands:"
	@echo "build-image: Build image from Dockerfile"
	@echo "run-interactive: Run docker container in interactive mode"
	@echo "run-train: Run training on default config"

build-image:
	docker build -t ${USERNAME}/${PROJECT}:${TAG} . 

run-interactive:
	docker run -it --rm --name ${TAG} \
	-v ${PWD}:/workspace \
	-w /workspace \
	${USERNAME}/${PROJECT}:${TAG} bash

run-train:
	@echo 'config change ${COMMAND} is defined'
	docker run -it --rm --name ${TAG} \
	-v ${PWD}/outputs:/src/outputs \
	-v ${PWD}/data:/src/data \
	-v ${PWD}/logs:/src/logs \
	${USERNAME}/${PROJECT}:${TAG} \
	assignment4_train ${COMMAND}

run-eval:
	@echo 'config change ${COMMAND} is defined'
	docker run -it --rm --name ${TAG} \
	-v ${PWD}/outputs:/src/outputs \
	-v ${PWD}/data:/src/data \
	-v ${PWD}/logs:/src/logs \
	${USERNAME}/${PROJECT}:${TAG} \
	assignment4_eval ${COMMAND}

push-image:
	echo "docker push ${USERNAME}/${PROJECT}:${TAG}" 

