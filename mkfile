</$objtype/mkfile

BIN=$home/bin/rc
TARG=psmove

install:V: $BIN/$TARG

$BIN/$TARG: $TARG
	cp $TARG $BIN/$TARG
