---
title: 'A very intriguing article title'
author:
  - Jane Doe:
      institute:
        - fosg
        - fop
      fullname: Prof. Jane DoItall Doe
      email: jane.doe@example.com
      orcid: 0000-0000-0000-0000
      equal_contributor: "yes"
      correspondence: "yes"
  - John Q. Doe:
      institute: fosg
      equal_contributor: "yes"
  - Peder Ås:
      institute: fosg
  - Juan Pérez:
      institute: acme
      email: juan.perez@example.edu
      correspondence: "yes"
institute:
  - pdt: Pandoc Development Team
  - fosg:
      name: Formatting Open Science Group
      address: 23 Science Street, Eureka, Mississippi, USA
      phone: +1 (555) 423 1338
      email: '{firstname}.{lastname}\@fosg.example.com'
  - fop: Federation of Planets
  - acme:
      name: Acme Corporation
keywords:
  - open science
  - document formats
  - markdown
  - latex
  - publishing
  - typesetting
bibliography: refs.bib
csl: peerj.csl
link-citations: true
project:
  title: Pandoc Scholar Example
  zip-url: https://github.com/pandoc-scholar/pandoc-scholar/releases
  github-url: https://github.com/pandoc-scholar/pandoc-scholar/
---

**Keywords:** open science, document formats, markdown, latex, publishing, typesetting

# Abstract

This is a brief article demonstrating the features of the pandoc-scholar approach to manuscript preparation. More details can be found at <https://github.com/pandoc-scholar>.

\newpage

# Introduction

Agile development of science depends on the continuous exchange of information between researchers [@woelfle_open_2011]. In the past, physical copies of scientific works had to be produced and distributed. Therefore, publishers needed to invest considerable resources for typesetting and printing. Since the journals were mainly financed by their subscribers, their editors not only had to decide on the scientific quality of a submitted manuscript, but also on the potential interest to their readers. The availability of globally connected computers enabled the rapid exchange of information at low cost. Yochai Benkler (2006) predicts important changes in the information production economy, which are based on three observations:

1. A nonmarket motivation in areas such as education, arts, science, politics and theology.
2. The actual rise of nonmarket production, made possible through networked individuals and coordinate effects.
3. The emergence of large-scale peer production, e.g. of software and encyclopedias.

Immaterial goods such as knowledge and culture are not lost when consumed or shared -- they are 'nonrival' --, and they enable a networked information economy, which is not commercially driven [@benkler_wealth_2006].

## Preprints and e-prints

The terms 'preprints' and 'e-prints' are used synonymously, since the physical distribution of preprints has become obsolete. A major drawback of preprint publishing are the sometimes restrictive policies of scientific publishers. The SHERPA/RoMEO project informs about copyright policies and self-archiving options of individual publishers (<http://www.sherpa.ac.uk/romeo/>).

## Open Access

The term _'Open Access'_ (OA) was introduced 2002 by the Budapest Open Access Initiative and was defined as:

_"Barrier-free access to online works and other resources. OA literature is digital, online, free of charge (gratis OA), and free of needless copyright and licensing restrictions (libre OA)."_ [@suber_open_2012]

Frustrated by the difficulty to access even digitized scientific literature, three scientists founded the _Public Library of Science (PLoS)_. In 2003, _PLoS Biology_ was published as the first fully Open Access journal for biology [@brown_why_2003;@eisen_publish_2003].


## Current standard publishing formats

Although the content elements of documents, such as title, author, abstract, text, figures, tables, etc., remain the same, the syntax of the file formats is rather different. **Tab. 2** demonstrates some simple examples of differences in different markup languages.



**Element**    | **Markdown**           | **LATEX**                                  | **HTML**
:------------- | :--------------------- | :----------------------------------------- | :----------------------------------
**structure**  |                        |                                            |
section        | `# Intro`              | `\section{Intro}`                          | `<h1>Intro</h1>`
subsection     | `## History`           | `\subsection{History}`                     | `<h2>History</h2>`
**text style** |                        |                                            |
bold           | `**text**`             | `\textbf{text}`                            | `<b>text</b>`
italics        | `*text*`               | `\textit{text}`                            | `<i>text</i>`
**links**      |                        |                                            |
HTTP link      | `<https:// arxiv.org>` | `\usepackage{url} \url{https://arxiv.org}` | `<a href="https:// arxiv.org"></a>`

  :Table 2. Examples for formatting elements and their implementations in different markup languages.


# Concepts of markdown and pandoc

Markdown was originally developed by John Gruber in collaboration with Aaron Swartz, with the goal to simplify the writing of HTML documents <http://daringfireball.net/projects/markdown/>. Instead of coding a file in HTML syntax, the content of a document is written in plain text and annotated with simple tags which define the formatting. Subsequently, the Markdown (MD) files are parsed to generate the final HTML document. With this concept, the source file remains easily readable and the author can focus on the contents rather than formatting. Despite its original focus on the web, the MD format has been proven to be well suited for academic writing [@ovadia_markdown_2014]. In particular, pandoc-flavored MD (<http://pandoc.org/>) adds several extensions which facilitate the authoring of academic documents and their conversion into multiple output formats. **Tab. 2** demonstrates the simplicity of MD compared to other markup languages. **Fig. 3** illustrates the generation of various formatted documents from a manuscript in pandoc MD. Some relevant functions for scientific texts are explained below in more detail.

![Workfow for the generation of multiple document formats with pandoc. The markdown (MD) file contains the manuscript text with formatting tags, and can also refer to external files such as images or reference databases. The pandoc processor converts the MD file to the desired output formats. Documents, citations etc. can be defined in style files or templates.](figs/Fig3.png "Workfow for the generation of multiple document formats with pandoc")

## Tables

There are several options to write tables in markdown. The most flexible alternative - which was also used for this article - are pipe tables. The contents of different cells are separated by pipe symbols (`|`):

```
Left | Center | Right | Default
:-----|:------:|------:|---------
 LLL  | CCC    | RRR   | DDD
```

gives

Left | Center | Right | Default
:--- | :----: | ----: | -------
LLL  |  CCC   |   RRR | DDD

The headings and the alignment of the cells are given in the first two lines. The cell width is variable. The pandoc parameter `--columns=NUM` can be used to define the length of lines in characters. If contents do not fit, they will be wrapped.

Complex tables, e.g. tables featuring multiple headers or those containing cells spanning multiple rows or columns, are currently not representable in markdown format. However, it is possible to embed LATEX and HTML tables into the document. These format-specific tables will only be included in the output if a document of the respective format is produced. This is method can be extended to apply any kind of format-specific typographic functionality which would otherwise be unavailable in markdown syntax.

## Figures and images

Images are inserted as follows:

```
![alt text](image location/ name)
```

e.g.

```
![Publishing costs](fig-hybrid-publishing-costs.png)
```

The _alt text_ is used e.g. in HTML output. Image dimensions can be defined in braces:

```
![](fig-hybrid-publishing-costs.png)
```

As well, an identifier for the figure can be defined with `#`, resulting e.g. in the image attributes `{#figure1 height=30%}`.

A paragraph containing only an image is interpreted as a figure. The _alt text_ is then output as the figure's caption.

## Formulas

Formulas are written in LATEX mode using the delimiters `$`. E.g. the formula for calculating the standard deviation $s$ of a random sampling would be written as:

```
$s=\sqrt{\frac{1}{N-1}\sum_{i=1}^N(x_i-\overline{x})^{2}}$
```

and gives:

$s=\sqrt{\frac{1}{N-1}\sum_{i=1}^N(x_i-\overline{x})^{2}}$

with $x_i$ the individual observations, $\overline{x}$ the sample mean and $N$ the total number of samples.

Pandoc parses formulas into internal structures and allows conversion into formats other than LATEX. This allows for format-specific formula representation and enables computational analysis of the formulas [@garnet_semiautomatic_2015].

## Code listings

Verbatim code blocks are indicated by three tilde symbols:

```
~~~
verbatim code
~~~
```

Typesetting `inline code` is possible by enclosing text between back ticks.

```
`inline code`
```

## Other document elements

These examples are only a short demonstration of the capacities of pandoc concerning scientific documents. For more detailed information, we refer to the official manual ( <http://pandoc.org/MANUAL.html>).

## Inserting citations

For inserting a reference, the database key is given within square brackets, and indicated by an '@'. It is also possible to add information, such as page:

```
[@suber_open_2012; @benkler_wealth_2006, 57 ff.]
```

gives [@suber_open_2012; @benkler_wealth_2006, 57 ff.].

## Styles

The Citation Style Language (CSL) <http://citationstyles.org/> is used for the citations and bibliographies. This file format is supported e.g. by the reference management programs Mendeley <https://www.mendeley.com/>, Papers <http://papersapp.com/> and Zotero <https://www.zotero.org/>. CSL styles for particular journals can be found from the Zotero style repository <https://www.zotero.org/styles>. The bibliography style that pandoc should use for the target document can be chosen in the YAML block of the markdown document or can be passed in as an command line option. The latter is more recommendable, because distinct bibliography style may be used for different documents.

## Creation of LATEX `natbib` citations

For citations in scientific manuscripts written in LATEX, the natbib package is widely used. To create a LATEX output file with natbib citations, pandoc simply has to be run with the `--natbib` option, but without the `--filter pandoc-citeproc` parameter.

## Database of cited references

To share the bibliography for a certain manuscript with co-authors or the publisher's production team, it is often desirable to generate a subset of a larger database, which only contains the cited references. If LATEX output was generated with the `--natbib` option, the compilation of the file with LATEX gives an AUX file (in the example named `md-article.aux`), which subsequently can be extracted using BibTool <https://github.com/ge-ne/bibtool>:

```
~~~
bibtool -x md-article.aux -o bibshort.bib
~~~
```

In this example, the article database will be called `bibshort.bib`.

For the direct creation of an article specific BIB database without using LATEX, we wrote a simple Perl script called `mdbibexport` (<https://github.com/robert-winkler/mdbibexport>).

# Meta information of the document

@background:bourne_database_2005 argues that journals should be effectively equivalent to biological databases: both provide data which can be referenced by unique identifiers like DOI or e.g. gene IDs. Applying the semantic-web ideas of @background:berners-lee_publishing_2001 to this domain can make this vision a reality. Here we show how metadata can be specified in markdown. We propose conventions, and demonstrate their suitability to enable interlinked and semantically enriched journal articles.

Document information such as title, authors, abstract etc. can be defined in a metadata block written in YAML syntax. YAML ("YAML Ain't Markup Language", <http://yaml.org/>) is a data serialization standard in simple, human readable format. Variables defined in the YAML section are processed by pandoc and integrated into the generated documents. The YAML metadata block is recognized by three hyphens (`---`) at the beginning, and three hyphens or dots (`...`) at the end, e.g.:

\newpage

```yaml
---
title: Formatting Open Science
subtitle: agile creation of multiple document types
date: 2017-02-10
...
```

The public availability of all relevant information is a central aspect of Open Science. Analogous to article contents, data should be accessible via default tools. We believe that this principle must also be applied to article metadata. Thus, we created a custom pandoc writer that emits the article's data as JSON–LD [@method:lanthaler_jsonld_2012], allowing for informational and navigational queries of the journal's data with standard tools of the semantic web. The above YAML information would be output as:

```json
{
  "@context": {
    "@vocab": "http://schema.org/",
    "date": "datePublished",
    "title": "headline",
    "subtitle": "alternativeTitle"
  },
  "@type": "ScholarlyArticle",
  "title": "Formatting Open Science",
  "subtitle": "agile creation of multiple document types",
  "date": "2017-02-10"
}
```

This format allows processing of the information by standard data processing software and browsers.

## Flexible metadata authoring

We developed a method to allow writers the flexible specification of authors and their respective affiliations. Author names can be given as a string, via the key of a single-element object, or explicitly as a `name` attribute of an object. Affiliations can be specified directly as properties of the author object, or separately in the `institute` object.

Additional information, e.g. email addresses or identifiers like ORCID [@haak_orcid_2012], can be added as additional values:

```yaml
author:
  - John Doe:
      institute: fs
      email: john.doe@example.com
      orcid: 0000-0000-0000-0000
institute:
  fs: Science Formatting Working Group
```

## JATS support

The journal article tag suite (JATS) was developed by the NLM and standardized by ANSI/NISO as an archiving and exchange format of journal articles and the associated metadata [@JATS], including data of the type shown above. The `pandoc-jats` writer by Martin Fenner is a plugin usable with pandoc to produce JATS-formatted output. The writer was adapted to be compatible with our metadata authoring method, allowing for simple generation of files which contain the relevant metadata.

## Citation types

Writers can add information about the reason a citation is given. This might help reviewers and readers, and can simplify the search for relevant literature. We developed an extended citation syntax that integrates seamlessly into markdown and can be used to add complementary information to citations. Our method is based on CiTO, the Citation Typing Ontology [@method:shotton_cito_2010], which specifies a vocabulary for the motivation when citing a resource. The type of a citations can be added to a markdown citation using `@CITO_PROPERTY:KEY`, where `CITO_PROPERTY` is a supported CiTO property, and `KEY` is the usual citation key. Our tool extracts that information and includes it in the generated linked data output. A general CiTO property (_cites_) is used, if no CiTO property is found in a citation key.

The work at hand will always be the subject of the generated semantic _subject-predicate-object_ triples. Some CiTO predicates cannot be used in a sensical way under this condition. Focusing on author convenience, we use this fact to allow shortening of properties when sensible. E.g. if authors of a biological paper include a reference to the paper describing a method which was used in their work, this relation can be described by the _uses_method_in_ property of the CiTO ontology. The inverse property, _provides_method_for_, would always be nonsensical in this context as implied by causality. It is therefore not supported by our tool. This allows us to introduce an abbreviation (_method_) for the latter property, as any ambiguity has been eliminated. Users of western blotting might hence write `@method_in:towbin_1979` or even just `@method:towbin_1979`, where _towbin_1979_ is the citation identifier of the describing paper by @towbin_electrophoretic_1979.

# Conclusions

Authoring scientific manuscripts in markdown (MD) format is straight-forward, and manual formatting is reduced to a minimum. The simple syntax of MD facilitates document editing and collaborative writing. The rapid conversion of MD to multiple formats such as DOCX, LATEX, PDF, EPUB and HTML can be done easily using pandoc, and templates enable the automated generation of documents according to specific journal styles.

The additional features we implemented facilitate the correct indexing of meta information of journal articles according to the 'semantic web' philosophy.

Altogether, the MD format supports the agile writing and fast production of scientific literature. The associated time and cost reduction especially favours community-driven publication strategies.

# Acknowledgments

We cordially thank Dr. Gerd Neugebauer for his help in creating a subset of a bibtex data base using BibTool, as well as Dr. Ricardo A. Chávez Montes, Prof. Magnus Palmblad and Martin Fenner for comments on the manuscript. Warm thanks also go to Anubhav Kumar and Jennifer König for proofreading.

\newpage


# References
