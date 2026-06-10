You are generating complete LaTeX application materials from a GitHub issue.

The issue represents one approved job listing.

## GitHub issue

Title:
Apply: AI Scientist — H1

Body:
## Listing

- Title: AI Scientist
- Organization: H1
- Location: Copenhagen, hybrid
- Link: https://jobs.lever.co/h1/c8dff275-d3c9-455d-b8fb-93c869a2be67

## Why it looked like a fit

Strong match for production ML, healthcare AI, NLP, Spark/Databricks, and life-science data work. The role involves building and deploying ML/NLP models on healthcare, clinical trial, claims, publication, and provider data.

## User interest signal

From Teams self-chat on 2026-06-10 at 19:43:05 UTC: "I like number 1"

This refers to number 1 in the immediately preceding digest sent at 19:06:58 UTC.

## Suggested next step

Review fit and tailor the CV/application around healthcare AI, NLP, production ML, and clinical/life-science data experience.

Labels:
job-application

## Primary task

Read the repository and generate complete LaTeX application materials for the job listing described in the issue.

Use the existing repository contents directly. Copy the relevant templates and edit only the copied output files.

## Inputs to inspect

Inspect, at minimum:

- profile YAML files
- style files
- job/listing files
- LaTeX templates
- previous application examples
- README files
- repository notes
- build scripts or Makefiles

## Required pre-writing steps

Before creating files:

1. Inspect the repository structure.
2. Identify the relevant listing.
3. Identify the LaTeX templates.
4. Identify the profile and style source files.
5. Identify relevant previous examples.
6. Research the advertising company or institution enough to tailor the application.
7. Decide a safe `listing_slug`.

## Outputs to generate

Save all outputs under:

`outputs/<listing_slug>/`

Generate:

- listing summary markdown including link to the listing
- tailored CV LaTeX source
- tailored cover letter LaTeX source
- compiled CV PDF
- compiled cover letter PDF
- job analysis markdown
- evidence mapping YAML or markdown
- missing fit / gap report markdown
- short generation summary markdown

## Strict rules

- Use only facts found in the repository.
- Do not invent experience, publications, grades, tools, employers, dates, awards, or achievements.
- Preserve the existing LaTeX template structure as closely as possible.
- Preserve the user's writing style: understated, technically precise, concrete, non-hypey.
- Tailor the materials to the listing.
- Make no changes outside `outputs/<listing_slug>/`.
- Do not modify profile files, templates, examples, README files, or source listings.
- Every major claim in the CV and cover letter must be traceable to a profile YAML file or previous application example.
- Where evidence is weak or missing, write a TODO or mention it in the gap report.
- Prefer omission over unsupported claims.
- Do not submit, email, or externally upload anything.

## Evidence mapping

Create an evidence map that links each major claim to its source.

Suggested format:

```yaml
claims:
  - claim: "..."
    used_in:
      - "cover_letter.tex"
      - "cv.tex"
    source_file: "profile/..."
    source_quote_or_summary: "..."
    confidence: high
```

## Compilation

Compile the LaTeX files into PDFs if the repository contains enough tooling to do so.

Prefer existing build commands if present. Otherwise use a standard LaTeX build command such as `latexmk` if available.

If compilation fails:
- keep the `.tex` sources
- save the build log under `outputs/<listing_slug>/`
- document the failure in the summary

## Final summary

At the end, summarise:

- files created
- files changed
- whether PDFs compiled successfully
- assumptions made
- missing information the user should add before submitting
