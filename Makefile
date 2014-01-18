
#### Pick one of the these ISO to use, SL isn't tested.

### Centos from http://mirrors.seas.harvard.edu/centos/6/isos/x86_64/CentOS-6.5-x86_64-bin-DVD1.iso"
image_basename=centos
ISO = CentOS-6.5-x86_64-bin-DVD1.iso
ISO_CHECKSUM = 83221db52687c7b857e65bfe60787838
ISO_CHECKSUM_TYPE = md5

### Scientific Linux
# image_basename=sl
# ISO = SL-65-x86_64-2013-12-16-Everything-DVD1.iso
# ISO_CHECKSUM = 2371b2c9f64911ca076bd6a812e30e0899687f13e5c9bcc3b5ff80111f154429
# ISO_CHECKSUM_TYPE = sha256



do-it : 
	echo "Doing nothing, consider making: vmware or digitalocean."

vmware-iso:
	egrep -v '// |^ *$$' template.json+ > template.tmp
	rm -rf output-vmware-iso
	packer build \
            -only=vmware-iso \
	    -var ISO=$(ISO) \
            -var ISO_CHECKSUM=$(ISO_CHECKSUM) \
            -var ISO_CHECKSUM_TYPE=$(ISO_CHECKSUM_TYPE) \
            -var image_basename=$(image_basename) \
	    -var-file empty-credentials.json \
	    template.tmp

digitalocean:
	egrep -v '// |^ *$$' template.json+ > template.tmp
	rm -rf output-digitalocean
	packer build \
            -only=digitalocean \
	    -var ISO=$(ISO) \
            -var ISO_CHECKSUM=$(ISO_CHECKSUM) \
            -var ISO_CHECKSUM_TYPE=$(ISO_CHECKSUM_TYPE) \
            -var image_basename=$(image_basename) \
	    -var-file digitalocean-credentials.json \
	    template.tmp

