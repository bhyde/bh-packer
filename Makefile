TEMPLATE = packing-template

doit:
	egrep -v '// |^ *$$' $(TEMPLATE).json+ > $(TEMPLATE).json
	packer build -only=vmware $(TEMPLATE).json
