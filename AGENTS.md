# Agent Instructions

This repository stores source-grounded job application materials and the workflows that generate them.

## Important Directories

- `profile/`: factual source of truth about the applicant.
- `profile/writing_style/`: tone, style, and narrative guidance.
- `prompts/`: generation, critique, and revision prompts.
- `templates/`: LaTeX templates. Follow `templates/AGENTS.md` when editing or adapting them.
- `outputs/`: listings and generated application materials.
- `secrets/`: private LaTeX material created locally or by GitHub Actions; never commit contents.
- `.github/workflows/`: issue-driven generation, rendering, and PR automation.

## Hard Rules

- Never invent facts.
- Never change files outside `outputs/<listing_slug>/` unless explicitly asked.
- Every major claim must be traceable to a profile YAML file, supplied listing material, or previous approved example.
- Prefer concise, concrete language.
- Avoid hype, exaggeration, and generic cover-letter phrasing.
- Use British English.
- Compile PDFs when possible.
- Do not commit `secrets/` contents or generated `build/` directories.

## Generated Application Outputs

Application packages should live under `outputs/<listing_slug>/`.

Expected files usually include:

- `listing.md`
- `job_analysis.md`
- `evidence_mapping.yaml`
- `gap_report.md`
- source `.tex` files such as `cv.tex`, `cover_letter.tex`, and optionally `research_statement.tex`
- rendered PDFs when compilation succeeds

If a listing does not require a document, omit it rather than generating filler.

## Private Material

The LaTeX templates expect contact details under repo-root `secrets/`:

- `secrets/personal_info_dk.tex`
- `secrets/personal_info_se.tex`

GitHub Actions creates these files from repository secrets and passes them to the render job as an artifact. Do not print their contents, include them in patches, or copy them into committed files.

## Workflow Notes

The application workflow creates `codex.patch` from generated source files. The render workflow applies that patch, downloads private material into `secrets/`, compiles PDFs, and emits `rendered.patch` when rendering succeeds.

If rendering fails, the PR still opens using `codex.patch`; the PR body should say that PDFs are missing and need manual rendering.

Generated patches must exclude:

- `secrets/personal_info_*.tex`
- `outputs/<listing_slug>/build/**`
- unrelated files outside `outputs/<listing_slug>/`

## Writing Standards

- Keep claims grounded and specific.
- Prefer omission over unsupported claims.
- Surface weak fit honestly in `gap_report.md`.
- Keep `evidence_mapping.yaml` useful enough for a reviewer to trace major claims quickly.
- Preserve the applicant's direct, modest voice.
