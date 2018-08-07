# Software Deposit: Guidance for Researchers (source code)

[The Software Sustainability Institute](http://www.software.ac.uk).

Sources for [softwaresaved.github.io/software-deposit-guidance/](https://softwaresaved.github.io/software-deposit-guidance)

---

## About these instructions

* These instructions were tested on Ubuntu 16.04.3 LTS xenial.
* Other versions of the tools may also be usable.
* Installing tools requires you to have sudo access to install and configure software (or a local system administrator to do this for you):

```bash
sudo su -
```

---

## Install dependencies

Install [Pandoc](http://pandoc.org/) document converter:

```bash
sudo apt-get install pandoc
pandoc --version
```
```
pandoc 1.16.0.2
```

Install [wkhtmltopdf](http://wkhtmltopdf.org/) HTML-to-PDF converter (using latest stable version, 0.12.5, for Ubuntu 16.04 Xenial, on web site):

```bash
wget https://downloads.wkhtmltopdf.org/0.12/0.12.5/wkhtmltox_0.12.5-1.xenial_amd64.deb
sudo apt install ./wkhtmltox_0.12.5-1.xenial_amd64.deb 
wkhtmltopdf  --version
```
```
wkhtmltopdf 0.12.5 (with patched qt)
```

Install [Anaconda Python 2.7](https://www.anaconda.com):

* If you already have Python you can skip this step.

```bash
wget https://repo.anaconda.com/archive/Anaconda2-5.2.0-Linux-x86_64.sh
bash Anaconda2-5.2.0-Linux-x86_64.sh
```

* Create: `anaconda2.sh`, with content:

```
export PATH=~/anaconda2/bin:$PATH
```

* Set environment:

```bash
source anaconda2.sh
```

Install [pyyaml](https://pyyaml.org/):

* If you have Anaconda Python you can skip this step.

```bash
pip install pyyaml
```

Install Microsoft TrueType core fonts:

```bash
apt-get install ttf-mscorefonts-installer
```

Install [linkchecker](https://github.com/linkchecker/linkchecker) 9.4:

```bash
wget https://github.com/linkchecker/linkchecker/archive/v9.4.0.tar.gz
tar -xf v9.4.0.tar.gz 
cd linkchecker-9.4.0/
pip install -r requirements.txt 
python setup.py install
linkchecker -V
```
```
LinkChecker 9.4.0 released xx.xx.xxxx
Copyright (C) 2000-2014 Bastian Kleineidam
```

---

## Edit guides

Guides are written in [Pandoc's Markdown](http://pandoc.org/MANUAL.html#pandocs-markdown).

The guides are in `markdown/`

For a check/tick mark in HTML, use the HTML entity, `&#x2714;`, in Markdown.

---

## Edit HTML template

The HTML template is in `templates/doc.html`. This was edited from a template created by `pandoc -D html`.

---

## Edit images

Image sources are in [images-src/](./images-src) as SVG files.

[Inkscape](https://inkscape.org/en/) is a free SVG editor which can be used to edit these files and export the images as PNG files.

Once you have edited an SVG, export the SVG as a PNG file and save it in [images/](./images). This can be done in Inkscape using the command File => Export PNG Image...

To avoid memory issues when creating PDFs, set the longest dimension of the PNG file to be 1000 pixels at 96 dpi. For example, if the image is 1234x567 set the width to 1000, if the image is 123x4567 set the height to 1000. Remember to lock the aspect ratio.

---

## Create PDF guides

Edit `config.yml`:

* Ensure this line is commented-out. If not then do so.

```
# LINK_URL: . 
```

* Ensure this line is uncommented. If not then do so.

```
LINK_URL: http://softwaresaved.github.io/software-deposit-guidance 
```

This ensures any hyperlinks between guides are absolute.

Run:

```bash
make pdf
```

This will process all the files in `markdown/` and create PDFs in `build/pdf/`. As an intermediate stage, it will create HTML documents in `build/html/`. These will have absolute URLs for inter-guide links. To create HTML documents with relative inter-guide links (e.g. for hosting on a web site) see the next section.

**Troubleshooting**

If you see an error like:

```
terminate called after throwing an instance of 'std::bad_alloc'Page 2 of 5
  what():  std::bad_alloc
Makefile:57: recipe for target 'build/pdf/<FILENAME>.pdf' failed
make: *** [build/pdf/<FILENAME>.pdf] Aborted (core dumped)
make: *** Deleting file 'build/pdf/<FILENAME>.pdf'
```

then it may be that one or more image files used in the guide are too big and causing `wkhtmltopdf`, which creates PDFs, to run out of memory. Try resizing the images and try again.

---

## Create HTML guides 

Edit `config.yml`:

* Ensure this line is commented-out. If not then do so.

```
# LINK_URL: http://softwaresaved.github.io/software-deposit-guidance 
```

* Ensure this line is uncommented. If not then do so.

```
LINK_URL: . 
```

This ensures any hyperlinks between guides are relative and suitable for online publication.

Run:

```bash
make html
```

This will process all the files in `markdown/` and create HTML documents in `build/html/.

---

## Check links

Run:

```bash
make check-links
```

This will display broken links, if any.

If you see an error e.g.

```
Makefile:66: recipe for target 'check-links' failed
make: [check-links] Error 1 (ignored)
```

then this can be ignored (an error code of 1 means that the `linkchecker` program encountered one or more broken links).

A full report is created in `build/link-check.txt`.

**Beware:** Certain links may be identified as broken when they in fact exist. See the Linkchecker FAQ, [Q:I still get an error, but the page is definitely ok](https://wummel.github.io/linkchecker/faq.html).

---

## Publish online

The online version of the guidance is published in the `gh-pages` branch of this repository. This can be updated as follows.

Create HTML guides, with relative inter-guide links, as described above.

Copy HTML into `gh-pages` branch and commit:

```bash
git checkout gh-pages
cp -r build/html/* .
git add *.html css imges
git commit -m "Updated guidance ..."
```

---

## Deposit in Zenodo (for information only)

Zenodo metadata:

* Communities: Research Data Network
* Upload type: Publication (for guides), Software (for source)
* Publication type: Working paper
* Click Digital Object Identifier => Reserve DOI
* Publication date: 2018-08-07
* Title:
* Authors: 
* Description:
* Version: 1.0
* Keywords:
  - research software
  - research outputs
  - repositories
  - digital preservation
  - software sustainability
  - software sustainability institute
* Additional notes: This work was funded by Jisc. The Software Sustainability Institute is supported by EPSRC grant EP/H043160/1 and EPSRC/BBSRC and ESRC grant EP/N006410/1.
* Funding: delete default entry.
* Related/alternate identifiers:
  - For each guide, add: "SOURCE-CODE-DOI" "complied/created this upload"
  - For source code deposit, add, for each guide, "GUIDE-DOI" "is compiled/create by this upload"
  - For "Software Deposit: Guidance for Researchers" deposit, add, for each other guide, "GUIDE-DOI" "is a supplement to this upload"

---

## Convert Word to Markdown (for information only)

The guidance was originally written in Microsoft Word then uploaded to Google Drive for community feedback. The Google Docs were then downloaded as Microsoft Word `.docx` files. These were then converted into Markdown using [word-to-markdown](https://github.com/benbalter/word-to-markdown) as follows.

Install dependencies:

```bash
sudo apt install ruby
sudo apt install ruby-dev
sudo apt install zlib1g-dev
sudo gem install word-to-markdown
```

Convert documents to Markdown:

```bash
source scripts/word_to_markdown.sh ~/guidance/*docx
```
```
Converting /home/user/guidance/Guidance.docx
Converting /home/user/guidance/HowToChooseSoftwareLicence.docx
Converting /home/user/guidance/HowToDeposit.docx
Converting /home/user/guidance/HowToDescribeDeposit.docx
Converting /home/user/guidance/HowToReviewDeposit.docx
Converting /home/user/guidance/WhatNotToDeposit.docx
Converting /home/user/guidance/WhatToDeposit.docx
Converting /home/user/guidance/WhenToDeposit.docx
Converting /home/user/guidance/WhereToDeposit.docx
Converting /home/user/guidance/WhyDeposit.docx
```
```bash
ls markdown/
```
```
Guidance.md                    HowToReviewDeposit.md  WhereToDeposit.md
HowToChooseSoftwareLicence.md  WhatNotToDeposit.md    WhyDeposit.md
HowToDeposit.md                WhatToDeposit.md
HowToDescribeDeposit.md        WhenToDeposit.md
```

The Markdown was then manually edited to clean it up and improve its formatting, and is currently in the `markdown` directory.

---

## Contributing

See [Contributing](./CONTRIBUTING.md).

---

## Copyright and Licence

Copyright (c) 2018, The University of Edinburgh

* Guidance (in markdown/ directory): Creative Commons Attribution 4.0 International
* Source code: Apache License, Version 2.0, January 2004

For full details, see [LICENCE](./LICENCE).
