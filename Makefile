.PHONY: build run

build:
	docker build -t dotfiles-test .

run:
	docker run --rm -w /root -it dotfiles-test bash
