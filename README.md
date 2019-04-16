# WHU-MathExpThesis
A dedicated LaTeX model for Mathematical Experiment course in Wuhan University.

# Usages:

## Including the .cls file
To include the document class into your LaTeX document, just type:
```latex
\documentclass{mathexpthesis}
```

## Options:
Three printing options are provided here:
* bwprint/colorprint
* withoutpreface
* withouttitlepage
* openbookmarknumber

Here is the usage with options:
```latex
\documentclass[your options here]{mathexpthesis}
```

## Parameter:
Six parameters are provided here:
* title
* groupno
* membera
* memberb
* memberc
* memberd

Make sure to declare them before you start your document.

## Compilation:
Use **xelatex** only. Select the right compile option in your LaTeX editor or use command line:
```
xelatex your-filename.tex
```

# Notice:

## Person number limitation:
As this template is dedicated for our project, only groups with exactly **four** persons are able to use it. To change this limitation, please change the **\memberx** declarations and make room for more(or less) person's names.

## Troubleshooting:
* LaTeX Package *hyperref* is somewhat incompatible with section numbers in this template. So if you turn *openbookmarknumber* on in your own document, there will be warnings. You can choose to ignore them.
* Normal appendix environment (\appendix) isn't supported in this template. That's why we use the *appendix* package, and you should create your appendices like this:
```latex
\begin{appendices}
Your appendices.
\end{appendices}
```
* This package can only be executed on Windows or Overleaf because of font issues.

## Project licenses:
This project uses LaTeX Project Public License, v1.3c or later.

The maintaining status of this project is 'maintained'.

The project maintainer is 'Tony Xiang'.

## Acknowledgements:
* [latexstudio/CUMCMThesis](https://github.com/latexstudio/CUMCMthesis)
* [latexstudio/gmcmthesis](https://github.com/latexstudio/GMCMthesis)
* Logo from Wuhan University

# Example:
See [test.pdf](https://github.com/T0nyX1ang/WHU-MathExpThesis/blob/master/test.pdf)(output), [test.tex](https://github.com/T0nyX1ang/WHU-MathExpThesis/blob/master/test.tex)(source code) for details.

Usage of MatLab or TikZ codes in test.tex is not permitted unless you contact me in advance.

# Contacts:
Forking or pulling requests of this project is strongly welcomed.

You can contact me on Github.
