# AGENTS – guidelines for coding assistants

This repository contains the source for the personal CV of **Christoph Kieslich**. Treat it as a content-first project where accuracy and tone matter more than code structure.

## Scope and intent

- Keep changes focused on improving the CV, its generation pipeline, or the documentation around it.
- Do not introduce new features, dependencies, or build tools unless explicitly requested in an issue or pull request.
- Never add secrets, tokens, or other private data.

## Editing the CV

- Edit `rendercv.yml` for content and layout changes.
- Do not edit `CV_Christoph_Kieslich.pdf` manually. Generate it from `rendercv.yml` with `mise run build`.
- The PDF in the repository root is a generated artifact produced by RenderCV and kept up to date on `main` by CI.

When updating content:

- Preserve the existing professional tone and concise bullet style.
- Keep dates, company names, and locations accurate; do not invent data.
- Avoid rewriting large sections of the CV unless explicitly requested.

## Automation and CI

- The GitHub Actions workflows in `.github/workflows/verify.yml` and `.github/workflows/release.yml` are the single source of truth for how the CV is built and released.
- The toolchain is defined in `mise.toml`, with Python dependencies declared in `pyproject.toml` and locked in `uv.lock`.
- When you make changes that affect the document, run `mise run build` locally. Branch and pull request builds (via `verify.yml`) upload `CV_Christoph_Kieslich.pdf` as an artifact; pushes to `main` (via `release.yml`) commit the PDF to the repository root so the README link stays current and publish GitHub Releases.
- The release workflow automatically creates incrementing semantic version tags (for example `v1.0.0`, `v1.0.1`, …) on pushes to `main`, and those tags drive the published releases.
- Do not modify the existing workflows or add new workflows unless an issue explicitly asks for it.

## Git and pull requests

- Use feature branches rather than committing directly to `main`.
- Keep pull requests small and focused (for example, "update IKEA role description" or "tweak skills section wording").
- Reference the relevant GitHub issue in the PR description (for example, `Closes #13`).

## Working with other agents

- If other coding agents have recently touched the CV, prefer incrementally improving their work instead of starting over from scratch.
- Respect existing conventions in RenderCV YAML keys and section ordering.

If any instruction here conflicts with an explicit request from Christoph in an issue or pull request, follow Christoph's request and keep the change set minimal.
