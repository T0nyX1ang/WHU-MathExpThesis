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

## Compliation:
Use **xelatex** only. Select the right compile option in your LaTeX editor or use command line:
```
xelatex your-filename.tex
```

# Notice:

## Person number limitation:
As this template is dedicated for our project, only groups with exactly **four** persons are able to use it. To change this limitation, please change the **\memberx** declarations and make room for more(or less) person's names.

## Project licenses:
This project uses LaTeX Project Public License, v1.3c or later.

The maintaining status of this project is 'maintained'.

The project maintainer is 'Tony Xiang'.

## Acknowledgements:
* latexstudio/CUMCMThesis
* latexstudio/gmcmthesis
* Logo from Wuhan University

## Contacts:
Forking or pulling requests of this project is strongly welcomed.
