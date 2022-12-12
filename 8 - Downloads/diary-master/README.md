journal
===============================================================================

It is based on Tufte-LaTeX classes.  So it sets a lot of things in the margin, 
so you'll have everything related to an entry in the same place.


Usage
-------------------------------------------------------------------------------

It provides three new commands '\diarytime', '\diarycite' and '\references'.
The first command, '\diarytime', sets a new date in the margin.  The second 
command, '\diarycite', prints the full bibliography entry for a reference in 
the margin.

The third command, '\references', prints the list of references for the current 
section.  For this command to work, the 'refsection' environment (or the 
'\newrefsection' command) from Biblatex must be used.  Simply put, it prints 
a list of references for all references used since the last '\newrefsection' 
command.  It's totally optional, use it only if you want to have all references 
for an entry in the same place.


Building
-------------------------------------------------------------------------------

You can compile the document using make(1).  Just type 'make' in the terminal 
and it'll build journal.pdf for you.  Use 'make clean' to remove all 
TeX-related build files and use 'make clean-depends' to remove the 
automatically downloaded files.
