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

## `psnumseq` — create mapping table

This tools provides a generator for mapping tables for `psmovem`.
It uses a simple mapping syntax similar to rc shell redirections.

	# move page 5 to 2, then the last page to 1
	; psnumseq file.ps '5=2' '-0=1'
	# the output can be directly used with psmovem
	; psmovem «numpages» `{psnumseq file.ps '5=2' '-0=1'}

Note that `0` is invalid while `-0` is valid! 

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

### `txt2ms` — text to troff-ms preprocessor

Convert formatted text files to a troff language (-ms like).

	# sample usage
	; txt2ms <file.txt | troff -ms ...

The format uses the two point glyph for special parsing of bold/italic: `‥italic‥ and ‥‥bold‥‥`.
To disable this parsing enable the `dontparse` flag.
Otherwise the format is markdown-like:

	# sample section
	## sample subsection
	### sample subsubsection
	
	New paragraph with ‥‥bold‥‥ and ‥italic‥ text.
	
	Another paragraph with \fBbold\fR and \fIitalic\fR text.

Keep in mind that the format only borrows from markdown.
Many features are _not_ supported (links, ...).

The converter is line oriented.
Therefore troff content can be included where needed.
Only empty lines and lines beginning with `#` are converted.

One special feature: The script is able to use the first line as a title, allowing quick ms-flavored documents.
To use this feature the `firstheader` variable needs to be set.

Set variables like this:

	; txt2ms -v 'firstheader=1' 'dontparse=1' < file.txt

Using `txt2ms` allows the creation of tables of contents.
The important lines are printed to stderr.

	; txt2ms < file.txt | troff >[2] aux.file

`lib/txtmk` is an _mk_ library file and can be used to compile indexes that can be included in the source text file (with `.so file.msi`).

**Note:** You need to filter the output if you have errors/warnings!
