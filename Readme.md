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

	# psmove from to <file.ps >output.ps
	; psmove 6 2 <file.ps >output.ps

`from` _must_ be greater than `to`!

## `psmovem` — move pages around according to a map

This tool can shuffle pages at will.
It needs two parameters: _number of pages_ and a _mapping table_.

The _mapping table_ is a comma separated list of page numbers.

	# reorder a document with 5 pages
	; psmovem 5 1,2,3,5,4 <file.ps >output.ps

## `pspnumber` — renumber pages

This tool takes postscript input and renumbers all pages sequentially.
It can be used to clean up after moving pages around with `psmove`.

It also fixes the `%%Pages:` page number attribute, but _only if_ it's set _after_ the pages.

	; pspnumber <file.ps >output.ps

## Additional troff tools

**Note:** I currently use me macros almost exclusively.
Some of these scripts might not work properly with other macro packages.

### `refx` — double references (troff)

This troff preprocessor is able to produce double references with _refer_.
This way you can have both footnotes _and_ bibliography, which is not possible with the ported refer.

	# refx flags
	; refx <file | troff ...

refx will invoke refer two times (with and without the accumulate flag).
