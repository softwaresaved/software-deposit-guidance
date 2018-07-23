# Software Deposit Guidance



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

The Markdown was then manually edited to clean it up and improve its formatting.
