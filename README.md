# Resume Builder

## 🧭 What this is

Resume Builder is a source-grounded job application workspace developed by Ivar Cashin Eriksson. It turns structured profile data, LaTeX templates, and a job listing into tailored application material: CVs, cover letters, research statements, evidence mappings, and gap reports.

The goal is not to automate judgement away. The goal is to make careful applications cheap enough to do consistently while keeping the final review human.

Approximate current runtime: about 10 minutes per application.
Approximate current model cost: about USD 0.30 per application.

## 🧱 Philosophy

The project is built around a few constraints:

- Facts live in `profile/`, not in prompts.
- Major claims should be traceable to source material.
- Missing fit should be surfaced rather than hidden.
- Language should stay concrete, modest, and in British English.
- Generated files should be easy to inspect before anything is sent.

This is why the repo keeps profile data, prompts, templates, private material, and generated outputs separate. The split makes it easier to change one part of the system without quietly changing the facts or the style.

## ⚙️ How it works

The main automated workflow is issue-driven:

1. A GitHub issue labelled `job-application` provides the listing and context.
2. GitHub Actions derives the application slug and output directory.
3. Codex creates the application source files under `outputs/<listing_slug>/`.
4. Private LaTeX material is created from GitHub Actions secrets and passed to the render job as an artifact.
5. The render job applies `codex.patch`, tries to compile PDFs, and emits `rendered.patch` if rendering succeeds.
6. A PR is opened for review.

If PDF rendering fails, the workflow still opens a PR using `codex.patch`. The PR body notes that rendering failed, so the generated source can still be inspected and fixed manually.

## 📁 Repository layout

```text
.
|-- profile/                 # factual source data
|-- profile/writing_style/   # tone, narrative, and style preferences
|-- prompts/                 # generation and critique prompts
|-- templates/               # LaTeX templates
|-- secrets/                 # local/private LaTeX inputs, ignored by Git
|-- other_material/          # local supporting assets such as images, ignored by Git
|-- outputs/                 # generated application packages
`-- .github/workflows/       # GitHub Actions automation
```

Git should track reusable source material and workflow code. Do not commit `secrets/`, build folders, or private generated material unless you explicitly intend to publish it.

## 🔐 Private material

The LaTeX templates expect contact details at render time:

```text
secrets/personal_info_dk.tex
secrets/personal_info_se.tex
```

In GitHub Actions these files are materialised from the `PERSONAL_INFO_DK_TEX` and `PERSONAL_INFO_SE_TEX` repository secrets, uploaded as a short-lived artifact, and downloaded into `secrets/` before LaTeX runs.

For local rendering, create the same files manually in `secrets/`.

## 📦 Generated output

A typical application directory looks like this:

```text
outputs/<listing_slug>/
|-- listing.md
|-- job_analysis.md
|-- cv.tex
|-- cover_letter.tex
|-- research_statement.tex
|-- evidence_mapping.yaml
|-- gap_report.md
`-- *.pdf
```

Not every application needs every document. For example, `research_statement.tex` is only relevant when a listing asks for one.

## 🖨️ Manual rendering

Compile from inside the generated output folder:

```powershell
cd outputs\<listing_slug>
pdflatex cv.tex
pdflatex cv.tex
pdflatex cover_letter.tex
pdflatex cover_letter.tex
pdflatex research_statement.tex
pdflatex research_statement.tex
```

Skip files that are not part of the application. The templates assume they are rendered from `outputs/<listing_slug>/`, because their private-material paths are relative to that location.

## 🛠️ Project notes

Current strengths:

- cheap enough to use for many applications
- evidence-first generation instead of free-form rewriting
- GitHub PR review before anything is submitted
- render fallback, so failed PDFs do not hide generated source files

Future ideas:

- richer local validation before opening the PR
- clearer reporting of unsupported claims
- better docs for job discovery and issue creation
- more structured quality gates around LaTeX rendering
