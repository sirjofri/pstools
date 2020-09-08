</$objtype/mkfile

BIN=$home/bin/rc
TARG=psmove refx

install:V:
	for(i in $TARG)
		mk $BIN/$i

$BIN/%: %
	cp $stem $BIN/$stem
