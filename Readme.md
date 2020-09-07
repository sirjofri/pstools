PSTools — A collection of PostScript shell tools
================================================

These are all smaller helper scripts for postscript output.
In my personal editing environment, I use troff to create postscript files.
Sometimes it is necessary to manually adjust the postscript file.

## `psmove` — move pages around

Use this tool to move pages around.
E. g. move the last page (table of contents) to the beginning, so we have a nicely formatted document with ordered pages.
All other pages are renumbered to fit the moved page.

	# psmove from to file.ps > output.ps
	; psmove 6 2 file.ps > output.ps

`from` _must_ be greater than `to`!
