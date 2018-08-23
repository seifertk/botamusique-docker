IMAGE_NAME="botamusique"

.PHONY: default
default:
	docker build -t $(IMAGE_NAME) .

.PHONY: clean
clean:
	docker image rm $(IMAGE_NAME)
