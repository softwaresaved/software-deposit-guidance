---
title: "Software Deposit: Why deposit software"
author: "Michael Jackson (ed.), The Software Sustainability Institute"
version: "%VERSION%"
doi: "doi:[%WHY_DOI%](http://doi.org/%WHY_DOI%)"
url: "[%DISPLAY_URL%/%WHY_PATH%](%LINK_URL%/%WHY_PATH%)"
date: "%DATE%"
---

## Introduction

Research software can be any collection of scripts or code written for, or used within, a research context. For example, a 50 line bash shell script for manipulating and filtering files, a collection of 50 line R scripts for running a bioinformatics analysis, 10,000 lines of Java for medical image analysis or 100,000 lines of Fortran using MPI for computational fluid dynamics are all examples of research software. But, why bother depositing research software into a digital repository? Why go to all that time and effort? What are the benefits to us as researchers for doing so? This guide describes some of the significant benefits that depositing research software delivers, both to you and to the research community. and also addresses concerns that you may have about sharing your software with others.

## About this guide

This guide was written by The Software Sustainability Institute, funded by Jisc. It forms part of a series of guides on software deposit. For an overview of all guides in the series, see Michael Jackson (ed.) (%DATE%). Software Deposit: Guidance for Researchers (Version %VERSION%). Zenodo. doi:[%GUIDANCE_DOI%](http://doi.org/%GUIDANCE_DOI%). Online: [%DISPLAY_URL%/%GUIDANCE_PATH%](%LINK_URL%/%GUIDANCE_PATH%).

![CC-BY 4.0 logo](./images/cc-by.png){#ccby-logo} This work is published under a Creative Commons Attribution 4.0 International License (CC BY 4.0), [https://creativecommons.org/licenses/by/4.0/](https://creativecommons.org/licenses/by/4.0/).

## Key points

![Why deposit software](./images/WhyDepositSoftware.png){#guidance-image}

## Your software is retained and remains available for the future

By depositing your software within a digital repository, the exact versions of your software upon which you have published your research results is retained and remains available for future use both by yourself and by other researchers. You enable other researchers, and your future self, to inspect, replicate, reproduce, and reuse your research, as manifested in your software, in the short term, and to inspect, for the historical record, in the long term. It allows your software to remain available beyond the lifetime of your current project, or your current employment at a specific institution.

Even if, in the long term, it is no longer possible to compile or run your software's source code, it still serves as a valuable historical record, as a programmatic description of how your research was implemented.

## Software is an integral part of the research ecosystem

Taken together, research software, data, facilities, equipment and an overarching research question can be viewed as a research activity or experiment, worthy to be published. Conversely, a publication can be considered as a narrative that describes how the research objects are used together to reply to the research question.

By depositing not just papers, but software and data sets [^1] as well, you are storing a more complete record of this ecosystem for future use of both yourself and others. Furthermore, many digital repositories allow you to explicitly express these relationships between your research outputs.

## Methods do not produce your results, software does

The results published in a paper are not typically produced by the method described in the paper. More commonly, they are produced by the implementation of that method using the other research outputs in the ecosystem, which includes the software. Your method may be scientifically valid, but your implementation may be flawed, which may give you misleading results, from which you draw incorrect conclusions. Making your software available can allow others to validate what you have done and to determine whether your conclusions are valid.

## Improve both quality and trust

Continuing on from the above, allowing others to validate what you have done can promote trust in your research, that you have nothing to hide and are open to others inspecting what you have done Yes, it is possible that errors will be found, but having mistakes identified offers a learning experience and an opportunity to improve the quality of your code for the next time. More importantly, it allows scientific outcomes, derived from data produced by the software, to be corrected and conclusions re-evaluated in light of these

Events such as the "ClimateGate" controversy of 2009 [^2] provide a worst-case example of what can happen when poor quality research software is developed away from the critical eyes of the community.

## Get credit for your research software

When you deposit your software into a digital repository you can get a unique persistent digital identifier for your deposit (for example, a DOI [^3] or an ARK [^4]). Others can cite this identifier to identify the exact version of your software that they used in their research, rather than just citing, for example, just your software's name and a URL (which may break in future), or a related paper (which, as mentioned above, is not your software itself).

In the same way you can expect others to cite your papers if they use them within their research, or to cite data [^5] of yours that you have deposited and they have used, you can request that others cite your software and so get attribution when your research, as manifested in your software, is used by others.

You can search for these citations in papers, publications, other software, documentation, web pages and blog posts and other software and so gather information relating to impact of your software. This can help you to demonstrate the impact of your software and its contribution to research to your employers, your fellow researchers and your funders. It allows you and your fellow authors, including non-academic researchers who may have developed the software with you, to get recognition and credit for this valuable research output. Some digital repositories provide features to track citations and count downloads [^6] to help you gather this information.

## Get collaborators

Researchers who read about your research, via a paper, for example, and then are able to reproduce or reuse your research, via using your research software, can be viewed as possible collaborators for future projects.

## Save time

Other researchers reading your publications may contact you for your software, after reading a related paper or seeing a presentation at a conference. Directing them to a digital repository with your software is far quicker than having to rake through your files, find the version of the software they need, bundle this up and send it to them.

More generally, having a digital repository manage hosting of your deposit is less time consuming than having to manage this yourself, on a departmental web server for example.

## Your funder or a publisher requires, or recommends, you to

Your funder or a publisher may require, or recommend, that you deposit your software into a digital repository. Your funder may want to ensure that the research that they have funded remains available. A publisher may want your software to be provided as a complement to any papers you publish which describe results which were, in some way, produced using your software.

Funders and publishers may support the concept of open access [^7], by which research outputs, including software, are distributed online and free of cost. For example, Wellcome Open Research require that software written by a paper's authors be deposited and recommend the use of Zenodo for archived software [^8], so its title, DOI and licence can be cited. Springer Nature's BioMed Central [^9] series of journals, requires both a link to a live version of the software (e.g. on GitHub) but also to an archived version with a DOI, for which Zenodo is recommended [^10].

## Are you concerned that...

### ...others may publish results based on your software before you do?

You may be concerned that you deposit your software then other researchers use your software to generate results and publish these before you yourself have a chance to.

There is a distinction between the time at which software is deposited into a digital repository and the time when it is published so that others can view it. Many digital repositories, including Zenodo [^11] and Figshare [^12], support **embargoes** which allow you to specify a date when you want the deposit to be made publicly available. So, for example, you could choose to set an embargo on your software deposit so that it is only made public after any related papers have been published.

A deposit can be embargoed for a long time. For example, Edinburgh DataShare supports embargos of up to 5 years [^13].

Another advantage of embargoes is that you can prepare your deposit and describe it, via metadata, while the knowledge of the version of your software being deposited is fresh in your mind.

Software licencing, described in our guide on "Software Deposit: How to choose a software licence" also allows you to control how and what other researchers can, and cannot, do with your software. You can, for example, make your software available solely for the purposes of validating your results.

### ...others may commercialise your software or disclose innovative aspects of your software?

Again, software licencing allows you to control what other researchers can, and cannot, do with your software.

### ..your code is too messy?

If your software is good enough for you to publish a paper with results based upon its use then it is good enough to be published so that other researchers can, at least, inspect it to validate your methodology. If others express concerns about its state then look upon that as a good thing both in that they are interested in your research and that you can learn from their comments and make improvements in the readability of code you write in future. See the section on "Improve both quality and trust" above.

## Find out more

Related Software deposit guides:

* Michael Jackson (ed.) (%DATE%). Software Deposit: What to deposit (Version %VERSION%). Zenodo. doi:[%WHAT_DOI%](http://doi.org/%WHAT_DOI%). Online: [%DISPLAY_URL%/%WHAT_PATH%](%LINK_URL%/%WHAT_PATH%).
* Michael Jackson (ed.) (%DATE%). Software Deposit: How to choose a software licence (Version %VERSION%). Zenodo. doi:[%LICENCE_DOI%](http://doi.org/%LICENCE_DOI%). Online: [%DISPLAY_URL%/%LICENCE_PATH%](%LINK_URL%/%LICENCE_PATH%).

Articles and blog posts on why researchers should share and deposit research software:

* Barnes, N. (2010) "Publish your computer code: it is good enough". Nature **467** , 753, 13 October 2010. doi:[10.1038/467753a](https://doi.org/10.1038/467753a). A case for why researchers should share their code.
* D. (2010) "If you're going to do good science, release the computer code too". The Guardian, 5 February 2010. [https://www.theguardian.com/technology/2010/feb/05/science-climate-emails-code-release](https://www.theguardian.com/technology/2010/feb/05/science-climate-emails-code-release).
* Klein, M., de Sompel, H.V., Sanderson, R., Shankar, H., Balakireva, L., Zhou, L., Tobin. R. (2014) "Scholarly Context Not Found: One in Five Articles Suffers from Reference Rot", PLOS One, 26 December 2014. doi:[10.1371/journal.pone.0115253](https://doi.org/10.1371/journal.pone.0115253). An article on the necessity of using persistent identifiers in research.
* Science Code Manifesto, [http://sciencecodemanifesto.org/](http://sciencecodemanifesto.org/). Five principles arising from software's integral position in 21st century research. The fifth is "Curation - Source code must remain available, linked to related materials, for the useful lifetime of the publication."

[^1]: DCC (2014). "Five steps to decide what data to keep: a checklist for appraising research data v.1". Edinburgh: Digital Curation Centre. Available online: [http://www.dcc.ac.uk/resources/how-guides/five-steps-decide-what-data-keep](http://www.dcc.ac.uk/resources/how-guides/five-steps-decide-what-data-keep)
[^2]: Climatic Research Unit email controversy, Wikipedia, [https://en.wikipedia.org/wiki/Climatic\_Research\_Unit\_email\_controversy](https://en.wikipedia.org/wiki/Climatic_Research_Unit_email_controversy)
[^3]: Digital Object Identifier (DOI), [https://www.doi.org/](https://www.doi.org/)
[^4]: Archival Resource Key (ARK)J. Kunze and R. Rogers (2008) The ARK Identifier Scheme, California Digital Library and US National Library of Medicine, May 2008. [https://escholarship.org/uc/item/9p9863nc](https://escholarship.org/uc/item/9p9863nc)
[^5]: Ball, A. & Duke, M. (2015). 'How to Cite Datasets and Link to Publications'. DCC How-to Guides. Edinburgh: Digital Curation Centre. Available online: [http://www.dcc.ac.uk/resources/how-guides](http://www.dcc.ac.uk/resources/how-guides)
[^6]: See, for example, Figshare, [https://figshare.com/](https://figshare.com/), or the University of Edinburgh DataShare, [https://datashare.is.ed.ac.uk](https://datashare.is.ed.ac.uk), which logs views by deposit page and deposited file.
[^7]: Open access, Wikipedia, [https://en.wikipedia.org/wiki/Open\_access](https://en.wikipedia.org/wiki/Open_access)
[^8]: "Software & source code", Wellcome Open Research, [https://wellcomeopenresearch.org/for-authors/data-guidelines](https://wellcomeopenresearch.org/for-authors/data-guidelines)
[^9]: BioMed Central, [https://www.biomedcentral.com](https://www.biomedcentral.com)
[^10]: "Software and code", BioMed Central, [https://www.biomedcentral.com/getpublished/editorial-policies](https://www.biomedcentral.com/getpublished/editorial-policies)
[^11]: Zenodo, [https://zenodo.org](https://zenodo.org)
[^12]: Figshare, [https://figshare.com](https://figshare.com)
[^13]: "Checklist for deposit", The University of Edinburgh, [https://www.ed.ac.uk/information-services/research-support/research-data-service/sharing-preserving-data/data-repository/checklist](https://www.ed.ac.uk/information-services/research-support/research-data-service/sharing-preserving-data/data-repository/checklist)
