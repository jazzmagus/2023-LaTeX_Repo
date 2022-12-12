Name of contribution: minutes
Name and email:       Knut Lickert <knut@lickert.net>
Location on CTAN:     tex-archive/macros/latex/contrib/minutes
                      http://tex.lickert.net/packages/minutes/index.html
Summary description:  Package for writing (collection of) minutes
German Information:   Paket zum Erstellen von Protokollen
                        to take minutes = Protokoll schreiben
                        protocoll = diplomatische Protokoll
License type:         Free (LaTeX Project Public License)

Announcement text:
----------------------------------------------------------------------
minutes.sty provides the creation of a collection of minutes.
Special features:
- Support of tasks (who, schedule, what, date of finishing),
    possibility of creating a list of open tasks
    inclusion of open tasks from other minutes ('open last year tasks')
    (also possible as task.sty)
- Support of attachments
- Support of schedule dates (support of calendar.sty)
- Different versions (`secret parts')
- Macros for votes and decisions (list of decisions)

The minutes package contains:
- minutes.dtx
- minutes.ins
- protokol.tex  German description
- Overview.tex  Include for minutes.dtx and protokol.tex
                Also stand-alone document
- Tagesordnung.tex
                A template for a "Mitgliederversammlung"
To run the examples, you need blindtext.sty.

After running minutes.ins this package include:
- minutes.sty   The style itself
- minutes.cfg   A configuration file
- Sample.tex    A file, including an English, Dutch and German minute
- SampleEN.tex  An English minutes (loaded by Sample.tex)
- SampleDE.tex  A German minutes (loaded by Sample.tex)
- SampleNL.tex  A Dutch  minutes (loaded by Sample.tex)
- MinStyGd.tex  A file to check the behavior with other classes,
                test different layouts...

====================================
Version 1.8b.
Solves some incompatibility with other packages.

Version 1.8c:
*Minor corrections (space around -- at time)
*Corrected documentation (previous pdf was uncomplete)

Version 1.8d (2009-12-04)
*Add Polish texts
*Correction French texts
*Correction in example file Protokol.tex (after error message in d.c.t.t.)
*Extend samples with attachments with label.

Version 1.8e:
Minor corrections Polish

Version 1.8f (2010-10-03/2016-10-01):
*corrections for optional minutes-title
*correction in texts (avoid unwanted spaces)
*Adaption version numbering in this readme
