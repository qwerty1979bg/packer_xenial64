default: all

all: kitchen

xenial64-vbox.box: xenial64.json 
	packer validate xenial64.json
	packer build -force -only=xenial64-vbox xenial64.json

kitchen-vbox: xenial64-vbox.box
	kitchen test vbox

kitchen: kitchen-vbox

.PHONY: clean
clean:
	-vagrant box remove -f xenial64 --provider virtualbox
	-rm -fr output-*/ *.box
