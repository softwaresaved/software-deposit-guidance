# Software Deposit Guidance for Researchers

[The Software Sustainability Institute](http://www.software.ac.uk).

---

## Convert Markdown to HTML and PDF

About these instructions:

* These instructions were tested on Ubuntu 16.04.3 LTS xenial.
* Other versions of the tools may also be usable.
* Installing tools requires you to have sudo access to install and configure software (or a local system administrator to do this for you):

```bash
sudo su -
```

### Install dependencies

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

Install linkchecker:

```bash
apt-get install linkchecker
linkchecker -V
```
```
INFO 2018-07-26 08:11:53,242 MainThread Checking intern URLs only; use --check-extern to check extern URLs.
LinkChecker 9.3 released 16.7.2014
Copyright (C) 2000-2014 Bastian Kleineidam
```

### Create HTML and PDF guidance

Run:

```bash
make pdf
```

This will process all the files in `markdown/` and create PDFs in `build/pdf/`. 

As an intermediate stage, it will create HTML documents in `build/html/`. These will have absolute URLs for inter-guide links.

To create HTML documents with relative inter-guide links (e.g. for hosting on a web site) see the next section.

### Create HTML guidance with relative inter-guide links

Edit `config.yml`:

* Ensure this line is commented-out. If not then do so.

```
# LINK_URL: %URL%/%VERSION% 
```

* Ensure this line is uncommented. If not then do so.
* Ensure this line is 

```
LINK_URL: . 
```

Run:

```bash
make html
```

This will process all the files in `markdown/` and create HTML documents in `build/html/.

### Check links

Run:

```bash
make check-links
```

A report is created in `build/link-check.txt`. To just see the broken links, run:

```bash
grep Real build/link-check.txt | sort
```

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

## Notes

* Markdown documents are written in [Pandoc's Markdown](http://pandoc.org/MANUAL.html#pandocs-markdown).
* `templates/doc.html` was edited from a template created by `pandoc -D html`.
* For a check/tick mark in HTML, use the HTML entity, `&#x2714;`, in Markdown.

---

## Contributing

See [Contributing](./CONTRIBUTING).

---

## Copyright and Licence

Copyright (c) 2018, The University of Edinburgh

* Guidance (in markdown/ directory): Creative Commons Attribution 4.0 International
* Source code: Apache License, Version 2.0, January 2004

For full details, see [LICENCE](./LICENCE).
