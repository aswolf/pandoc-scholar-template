# Template for pandoc-scholar articles
* A simple template for creating manuscripts using pandoc-scholar
* This template is based on the original pandoc-scholar manuscript repo (https://github.com/robert-winkler/scientific-articles-markdown.git) and the example article included with the pandoc-scholar install

* Note that this template modifies some of the pandoc-scholar defaults in order to organize and simplify use.



# Renumbering the Appendix

Renumbering appendix sections is not currently incorporated into pandoc. So the Appendix section numbers will continue from the main text in the resulting manuscript. This is fine for many uses, but manually fixing this prior to submission is a good idea. This can be done in the latex output file by surrounding the appendix content with the following two code blocks:

Before appendix:
```
\appendix
\renewcommand{\thesection}{\Alph{section}.\arabic{section}}
\setcounter{section}{0}

\begin{appendix}
\section{Appendix}
```

After appendix:
```
\end{appendix}
```

This will completely fix the numbering issue.
