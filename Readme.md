PSTools — A collection of PostScript shell tools
================================================

These are all smaller helper scripts for postscript output.
In my personal editing environment, I use troff to create postscript files.
Sometimes it is necessary to manually adjust the postscript file.

These tools are intentionally not the most performant.
They are meant to just work.
Feel free to contribute more performant versions as well as other tools.

## `psmove` — move pages around

Use this tool to move pages around.
E. g. move the last page (table of contents) to the beginning, so we have a nicely formatted document with ordered pages.
All other pages are renumbered to fit the moved page.

	# psmove from to <file.ps > output.ps
	; psmove 6 2 <file.ps >output.ps

`from` _must_ be greater than `to`!

## Additional troff tools

**Note:** I currently use me macros almost exclusively.
Some of these scripts might not work properly with other macro packages.

### `refx` — double references (troff)

This troff preprocessor is able to produce double references with _refer_.
This way you can have both footnotes _and_ bibliography, which is not possible with the ported refer.

	# refx flags
	; refx <file | troff ...

refx will invoke refer two times (with and without the accumulate flag).
