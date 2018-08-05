default: all


all: kitchen

xenial64-vbox.box: xenial64.json 
	packer validate xenial64.json
	packer build -force -only=xenial64-vbox xenial64.json

xenial64-vmware.box: xenial64.json
	packer validate xenial64.json
	packer build -force -only=xenial64-vmware xenial64.json

kitchen-vbox: xenial64-vbox.box
	kitchen test vbox

kitchen-vmware: xenial64-vmware.box
	kitchen test vmware

kitchen: kitchen-vbox kitchen-vmware
