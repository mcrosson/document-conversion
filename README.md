## What's here?

A simple pandoc + latex document conversion environment. This is a very *simple* setup that will make converting from markdown, org-mode, etc into other output formats pretty straight forward and simple.

This environment takes care of most of the fine tuning to get *generic* and *standard* output. This is not meant to be fancy, complex or nuanced. This project is also *not* designed to be highly tunable. It's a *very opinionated* project.

However, this project *does* include two important "hooks" to allow users to customize output:

- An `authorship.yml` file that allows users to specify authorship details
- A `defaults_user.yml` file that allows users to lightly fine tune the pandoc conversion process

## Prerequisites / Dependencies

You will need a working installation of pandoc that has lua support and a LaTeX environment that has xetex to use this project.

You can also use Docker to run this project. See the `run.ps1` and `build.ps1` scripts for more information.

## Supported file formats

### Input formats

This project should support any input format that pandoc supports. However, only the following have been tested:

- markdown
- org-mode

### Output formats

This project should support any output format that pandoc supports. However, only the following have been tested:

- pdf
- html
- epub
- docx (Microsoft Word)
- odt (LibreOffice Writer)

## Usage

### Required setup

The following need to be setup prior to running any conversions. These are *required* setup items for using this project.

`authorship.yml.changeme`
: This file should be copied to `authorship.yml` and adjusted. Existence of the `authorship.yml` file is *required* for this project to work. If you do not want authorship set, leave the `authorship.yml` file empty.

`defaults_user.yml.changeme`
: This file should be copied to `defaults_user.yml` and ajusted. The `defaults_user.yml` file is *required* for this project to work. This file *must* also contain *valid* YAML and *not* be an empty file. Leaving just the `exclude_tags` option and setting it to gibberish is the easiest way to "disable" this file.

### epub setup

In addition to the above items you *must* create a file with any additional metadata to embed in the epub file. The metadata file should have the same name as the input file with `.yml` added to the end. For example, if you were converting `my_document.md` to epub, you'd also have to create a `my_document.md.yml` file that contains the metadata to embed in the epub.

An example file showing common metadata fields (see the pandoc manual for more) is located at `epub.meta.yml`.

Please Note: You *can* leave this file empty if you do not need to add any additional metadata to the epub output.

### Excluding sections

This project is setup to allow use of the `noexport` tag for org-mode files and implements a similar hook for markdown files. To exclude a heading from output when converting a markdown file, add `{.noexport}` to the end of the heading.

### Table of contents

This project enables generation of a table of contents for *all* output formats. If you do not want an auto generated table of contents...

- You can add `toc: false` to the front matter of a markdown file
- You can add `toc: false` to the top of the `defaults_user.yml` for all other input formats

### Converting files

Run `_convert.sh` and pass the file name and any formats you want to convert to as arguments.

Some examples:

```sh
# Convert to pdf
_convert.sh my_document.md pdf

# Convert to epub and html
_convert.sh my_document.md epub html

# Convert to all tested formats
_convert.sh my_document.md
```

`_convert.sh` should support all file formats supported by pandoc. Simply use the file extension to select the output format(s).

The tested output formats that will be generated if no output format(s) supplied:

- `pdf`
- `html`
- `epub`
- `docx`
- `odt`

## Directories

### Attic

The `attic` folder is meant to act as an archive of previously converted files and/or place to put files that are no longer actively needed but you want save for the long-term.

This folder is mainly here to act as a history of conversions. Feel free to ignore and not use this folder.

### Input (source) files

Place any input files to convert in the main `input` directory, *not* a subdirectory. Input subdirectories are *not* supported by this project.

It is assumed you will move files out of this directory once conversion is complete to avoid this directory filling with a large number of files.

### Output files

All output files will be placed in the `output` directory, *not* a subdirectory. 

It is assumed you will move files out of this directory once conversion is complete to avoid this directory filling with a large number of files.

## Licensing

### Included fonts

Both [Askinson Hyperlegible](https://www.brailleinstitute.org/freefont/) and [Deja Vu](https://dejavu-fonts.github.io/) fonts are included and used by this project. They are free fonts with licensing independent of the rest of this repo.

[Monaspace](https://monaspace.githubnext.com) (all forms of the NerdFont release) is a modern Monospaced font that's been included for those who wish to use a very modern monospaced font.

### This project

This project is licensed under the [Apache 2.0 License](LICENSE).
