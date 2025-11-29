# CV - Christoph Kieslich

This repository contains the source for my CV, generated from a [Typst](https://typst.app) document and a YAML configuration file.

You can always download the latest compiled PDF from the repository root as [`CV_Christoph_Kieslich.pdf`](CV_Christoph_Kieslich.pdf).

## Repository structure

- `cv.typ` – Typst source file using the `@preview/vantage-cv` template.
- `configuration.yml` – Data for experience, education, skills, and other CV content.
- `CV_Christoph_Kieslich.pdf` – Generated CV committed by CI on `main` so the link above stays up to date.
- `.github/workflows/build.yml` – GitHub Actions workflow that builds the PDF on pushes to `main`, pull requests, and tagged releases.

## Editing the CV

Most updates can be made by editing `configuration.yml`:

- Add or update roles under `jobs`.
- Adjust the headline (`position`) and `tagline`.
- Update contact details under `contacts`.
- Tweak skills, methodologies, and other lists.

For structural or layout changes, edit `cv.typ`.

After committing and pushing your changes, GitHub Actions will compile `cv.typ` and upload `CV_Christoph_Kieslich.pdf` as a build artifact. When changes land on `main`, the workflow also commits the updated PDF to the repository root.

## Building locally

If you have the [Typst CLI](https://github.com/typst/typst) installed, you can build the PDF locally:

```bash
typst compile cv.typ
```

This will produce `cv.pdf` in the repository root. You generally do not need to commit this local file; CI will generate and commit `CV_Christoph_Kieslich.pdf` on `main`.

## Releases

The build workflow also supports tagged releases. When you push a git tag (for example `v1.1.0`) on `main`, GitHub Actions will:

- Compile `cv.typ` to a PDF.
- Rename `cv.pdf` to `CV_Christoph_Kieslich.pdf`.
- Create a GitHub Release for that tag.
- Attach the generated `CV_Christoph_Kieslich.pdf` to the release.

## Notes for coding agents

If you're an automated coding assistant working in this repository, please read [AGENTS.md](AGENTS.md) before making changes.
