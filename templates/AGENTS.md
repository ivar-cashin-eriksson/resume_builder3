# Template Agent Instructions

These instructions apply when working with files in `templates/` or when adapting those templates into `outputs/<listing_slug>/`.

## Purpose

The templates provide the LaTeX structure for application materials:

- `cv.tex`: tailored CV
- `cover_letter.tex`: one-page cover letter
- `research_statement.tex`: research statement for research-heavy or PhD applications

Use the templates as structure, not as a source of facts.

## Hard Rules

- Never invent facts, publications, grades, supervisors, awards, tools, employers, dates, or achievements.
- Use only claims supported by `profile/`, the listing, supplied material, or previous approved examples.
- Every major claim in generated application material must be traceable to source material.
- Use British English.
- Keep prose direct, concrete, modest, and free of generic cover-letter phrasing.
- Do not hard-code private contact details into generated source files.
- Contact details must be loaded through `../../secrets/personal_info_dk.tex` or `../../secrets/personal_info_se.tex`.
- Do not commit `secrets/` contents or generated `build/` directories.

## CV Guidance

- Keep all content before `\newpage` to one rendered page.
- Keep first-page bullets short enough to avoid wrapping where possible.
- Preserve template structure unless there is a clear application-specific reason to change it.
- Do not remove the thesis link.
- Do not remove existing `\newline` spacing commands from detailed entries unless fixing a concrete layout problem.
- Keep the `\hfill{\small{\textit{\hyperref[sec:...]{Read more...}}}}` links when the matching detailed section remains.
- For PhD or research roles, prioritise education, RaySearch, research fit, and relevant technical depth.
- For industry roles, prioritise relevant work experience, production systems, domain fit, and practical impact.
- Focus tailoring on the introduction, selected first-page sections, keywords, and detailed sections.

## Cover Letter Guidance

- Keep the cover letter to one rendered page.
- Use a named recipient or committee only when supported by the listing.
- Make the opening specific to the role without exaggerating fit.
- Prefer concrete links between the listing and source-backed experience.
- Avoid hype, broad claims, and generic enthusiasm.
- Do not introduce new experience that is not present in the source material.

## Research Statement Guidance

- Use `templates/research_statement.tex` when the listing asks for a research statement or project proposal.
- Keep the author/contact block out of the research statement; the template intentionally starts with title and subtitle.
- Use normal LaTeX sectioning: `\section`, `\subsection`, and `\subsubsection`.
- Use `\cite{...}` and `\bibitem{...}` for references.
- Cite only papers, labs, tools, methods, or supervisors supported by the listing, profile files, user-provided material, or inspected sources.
- Keep the statement concrete: problem, research questions, method, evaluation, expected contribution, and fit.
- Do not overstate literature familiarity or prior research experience.

## Placeholder Handling

- Replace all placeholders before finalising generated source files.
- Calculate `<<YEARS_OF_EXPERIENCE>>` from 2019 unless a listing-specific framing requires a narrower scope.
- Keep `<<RELEVANT_COURSEWORK_LIST>>` to at most 3 compact items from `profile/courses.yaml`.
- Choose `<<RELEVANT_TECHNICAL_THEMES>>` from supported experience, such as explainable AI, probabilistic modelling, NLP, computer vision, forecasting, MLOps, or production ML systems.
- Leave unsupported attractive claims out rather than softening them into vague language.

## Rendering Expectations

- Generated `.tex` files should compile from inside `outputs/<listing_slug>/`.
- Private material should be referenced as `../../secrets/personal_info_dk.tex` or `../../secrets/personal_info_se.tex`.
- GitHub Actions materialises those files from repository secrets during rendering.
- If PDF rendering fails, the workflow still opens a PR with generated source files; note likely LaTeX fixes in `gap_report.md` or `generation_summary.md` if relevant.

## Final Checks

- Confirm all placeholders are gone.
- Confirm no unsupported facts were added.
- Confirm `evidence_mapping.yaml` covers major CV and cover-letter claims.
- Confirm `gap_report.md` is honest about weak or missing fit.
- Confirm the CV first page and cover letter are likely to fit before relying on rendered PDFs.
- Compile PDFs when possible.
