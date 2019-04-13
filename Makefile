.PHONY: build run

build:
	docker build -t dotfiles-test .

run:
	docker run --rm -v `pwd`:/project -w /project -it dotfiles-test bash
