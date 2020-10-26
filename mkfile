</$objtype/mkfile

BIN=$home/bin/rc
TARG=\
	refx\
	psmove\
	psmovem\
	pspnumber\

install:V: ${TARG:%=$BIN/%}

$BIN/%: %
	cp $stem $BIN/$stem
