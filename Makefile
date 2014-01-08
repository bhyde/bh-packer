TEMPLATE = packing-template

doit:
	egrep -v '// |^ *$$' $(TEMPLATE).json+ > $(TEMPLATE).json
	rm -rf output-vmware
	packer build -only=vmware $(TEMPLATE).json
