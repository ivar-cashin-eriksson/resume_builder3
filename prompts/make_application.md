Read the repository and generate the complete LaTeX application materials for the <<LISTING>> listing.

Your task is to use the existing repo contents directly, copy the templates and edit accordingly.

Inputs to inspect:
- profile/ YAML files
- style files
- job/listing file
- LaTeX templates
- any previous application examples
- README or repo notes

Goal:
Create finished LaTeX source files for tailored this specific listing.

Generate:
- tailored CV LaTeX source
- tailored cover letter LaTeX source
- job analysis markdown
- evidence mapping YAML or markdown
- missing fit / gap report markdown

Rules:
- Use only facts found in the repo.
- Do not invent experience, publications, grades, tools, or achievements.
- Follow the existing LaTeX templates as closely as possible.
- Preserve my writing style: understated, technically precise, concrete, non-hypey.
- Tailor the materials to the listing.
- Make no changes to the rest of the repository.
- Save outputs under `outputs/<listing_slug>/`.
- Compile PDFs from LaTeX source.

Important:
For each major claim in the cover letter and CV, it should be traceable to a profile YAML or previous application example.

Before writing files:
1. Inspect the repo structure.
2. Identify the relevant listing.
3. Identify the LaTeX templates.
4. Identify the profile/style source files.
5. Research the advertising company/institution to better tailor the application towards it/them.

Then generate the materials directly.
At the end, summarise:
- files created
- files changed
- whether PDFs compiled successfully
- any missing information I should add before submitting
