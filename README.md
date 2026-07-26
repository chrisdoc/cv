# CV - Christoph Kieslich

This repository contains the source for my CV, generated from [`rendercv.yml`](rendercv.yml) with [RenderCV](https://rendercv.com/).

You can always download the latest compiled PDF from the repository root as [`CV_Christoph_Kieslich.pdf`](CV_Christoph_Kieslich.pdf).

## Repository structure

- `rendercv.yml` – CV content and layout configuration.
- `mise.toml` – Pinned local tools and build tasks.
- `pyproject.toml` and `uv.lock` – Locked RenderCV environment.
- `CV_Christoph_Kieslich.pdf` – Generated CV committed by CI on `main` so the link above stays up to date.
- `.github/workflows/release.yml` – GitHub Actions workflow that builds the PDF on pushes to `main` and tags, commits the updated PDF on `main`, and publishes GitHub Releases.
- `.github/workflows/verify.yml` – GitHub Actions workflow that verifies pull requests by rendering the CV and uploading the generated PDF as an artifact.

## Editing the CV

Edit `rendercv.yml` to update content or layout. After committing and pushing your changes, GitHub Actions will render and upload `CV_Christoph_Kieslich.pdf` as a pull-request artifact. When changes land on `main`, the release workflow also commits the updated PDF to the repository root.

## Building locally

Install the pinned tools and dependencies, then build the PDF:

```bash
mise install
mise run setup
mise run build
```

The build writes `CV_Christoph_Kieslich.pdf` directly to the repository root. If `mise` already manages your tools, `mise run build` is sufficient because `uv run --locked` keeps the project environment in sync.

## Releases

The release workflow also manages tagged releases. When a change is pushed to `main`, it will automatically create the next semantic version tag (for example `v1.1.0`) and push it. Tag pushes then trigger the workflow again so GitHub Actions can:

- Render `rendercv.yml` directly to `CV_Christoph_Kieslich.pdf`.
- Create a GitHub Release for that tag.
- Attach the generated `CV_Christoph_Kieslich.pdf` to the release.

## Notes for coding agents

If you're an automated coding assistant working in this repository, please read [AGENTS.md](AGENTS.md) before making changes.
