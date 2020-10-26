</$objtype/mkfile

BIN=$home/bin/rc
TARG=\
	refx\
	psmove\
	psmovem\
	pspnumber\
	psnumseq\

install:V: ${TARG:%=$BIN/%}

$BIN/%: %
	cp $stem $BIN/$stem
