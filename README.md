# Resume Builder

Structured workspace for producing tailored CVs, cover letters, and research statements. The repo separates reusable source material from private inputs and generated application outputs.

## Structure

```text
.
|-- profile/                 # Factual source data for applications
|-- profile/writing_style/   # Tone and style guidance
|-- prompts/                 # Reusable generation prompts
|-- templates/               # Base LaTeX templates
|-- job_listings/            # Private adverts/listings, ignored by Git
|-- other_material/          # Private supporting files, ignored by Git
|   |-- personal_info_dk.tex # Denmark contact details loaded by CV/letter templates
|   |-- personal_info_se.tex # Sweden contact details loaded by CV/letter templates
|   `-- images/              # Local image assets used by LaTeX
`-- outputs/                 # Generated application packages, ignored by Git
```

Git should track the reusable parts: `profile/`, `prompts/`, `templates/`, and the root docs. Private or generated material belongs in `job_listings/`, `other_material/`, or `outputs/`.

## Requirements

- A LaTeX distribution such as MiKTeX, TeX Live, or MacTeX.
- Template packages: `moderncv`, `geometry`, `xcolor`, `hyperref`, and `microtype`.
- No Python or Node setup is currently required.

## Private Material

Keep country-specific contact details in:

```text
secrets/personal_info_dk.tex
secrets/personal_info_se.tex
```

The CV and cover letter templates default to the Denmark file after they are copied into `outputs/<listing_slug>/`. For Sweden-facing applications, change the `\input` line to `../../secrets/personal_info_se.tex`. Image paths inside both personal info files should remain relative to the generated output folder:

```tex
\includegraphics[height=0.9em]{../../other_material/images/<file>}
```

Put transcripts, references, examples, signatures, and other non-public material under `other_material/`.

## Creating An Application

1. Save the listing under `job_listings/`.
2. Update `profile/*.yaml` if the application needs facts that are missing.
3. Use `prompts/make_application.md` to generate the materials.
4. Save generated files under `outputs/<listing_slug>/`.
5. Review the evidence mapping and gap report before submitting.

Typical generated files:

```text
outputs/<listing_slug>/
|-- cv.tex
|-- cover_letter.tex
|-- research_statement.tex
|-- job_analysis.md
|-- evidence_mapping.md
`-- gap_report.md
```

## Compiling

Compile from inside the generated output folder:

```powershell
cd outputs\<listing_slug>
pdflatex cv.tex
pdflatex cover_letter.tex
pdflatex research_statement.tex
pdflatex research_statement.tex
```

Skip the research statement if the listing does not require one. The templates assume this output-folder location; compiling directly from `templates/` may require temporary path adjustments.

## Rules

Follow `templates/README.md` for detailed adaptation rules. The short version:

- Use only facts from `profile/`, the listing, or supplied supporting material.
- Do not invent publications, grades, supervisors, awards, tools, or experience.
- Keep the tone direct, personal, factual, and modest.
- Keep the CV first page and the cover letter to one page each.
- Replace all placeholders before compiling.
- Manually inspect PDFs before submitting.
