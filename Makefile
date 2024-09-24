.PHONY: all
all:
	docker buildx build -t louisroyer/network-debug ./network-debug
