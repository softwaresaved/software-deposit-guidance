# Software Deposit Guidance


## Convert Markdown to HTML and PDF

About these instructions:

* These instructions were tested on Ubuntu 16.04.3 LTS xenial.
* Other versions of the tools may also be usable.
* Installing tools requires you to have sudo access to install and configure software (or a local system administrator can do this for you):

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

`templates/doc.html` was edited from a template created by `pandoc -D html`.
