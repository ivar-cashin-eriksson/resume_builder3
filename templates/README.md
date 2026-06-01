# LLM Application Template

This folder contains LLM-friendly templates to make `cv.tex`, `cover_letter.tex`, and `research_statement.tex` for applications.
Use it to adapt the application to a new advert while preserving Ivar's writing style and factual qualifications.

## Adaptation Rules

- Use only qualifications stated in the source files or the shared repo sections.
- Do not invent publications, tools, supervisors, awards, research experience, or domain experience.
- Keep the tone direct, personal, and factual. Avoid marketing language.

### CV

- Ensure that the information before the `\newpage` command is strictly one page or less. 
  - Choose a subset of sections to include or this will not be possible.
  - Shorten sections as you see fit to meet the lenght requirements.
  - Keep all bullets in the pre-`\newpage` section concise so they render on a single line in the final PDF. Use at most one short clause per bullet and shorten any item that would wrap in the moderncv layout.
- Do not alter the syntax/structure of the individual items.
  - Do not remove the thesis link: `\href{https://kth.diva-portal.org/smash/get/diva2:1431327/FULLTEXT02.pdf}{See thesis}`. 
  - Do note remove any `\newline` commands.
  - Do not remove the `\hfill{\small{\textit{\hyperref[sec:XXX]{Read more...}}}}` statements.
- Reorder or remove sections from CV as you see fit.
  - For PhD positions place eductation and RaySearch first.
  - For normal job listings place work experience first.
- Keep CV content edits focused mainly to 
  - The introduction
  - Detailed sections
  - Selecting keywords

#### Placeholder Guidance

- `<<RELEVANT_COURSEWORK_LIST>>`: Choose at most 3 compact items, either course names or themes, from `profile/courses.yaml`. Examples: Statistical Machine Learning; Optimization; Probabilistic Modelling. Keep the entire entry short enough to fit on one line in the rendered CV.
- `<<ADJECTIVE>>`: Such as the ones listed in `profile/profile.yaml`
- `<<YEARS_OF_EXPERIENCE>>`: Calculate from 2019
- `<<RELEVANT_INDUSTRIES>>`: Such as Life Science, Pharma, Manufacturing, Finance, or derived from `profile/experience.yaml`
- `<<RELEVANT_TECHNICAL_THEMES>>`: Examples include explainable AI, latent representations, probabilistic modelling, production ML systems, NLP, computer vision, forecasting, MLOps.
- `<<TARGET_RESEARCH_AREA>>`: concise advert-specific phrase, e.g. `interpretable and reliable AI`.

### Cover Letter 

- Keep to one page.

#### Placeholder Guidance

- `<<CONTACT_OR_COMMITTEE>>`: use named supervisors if clear, otherwise use the committee.
- `<<POSITION_TITLE>>`: copy the advert title exactly when it makes sense.
- `<<YEARS_OF_EXPERIENCE>>`: Calculate from 2019
- `<<PROJECT_TOPIC_OR_GOAL>>`: one concise advert-specific phrase.
- `<<GROUP_OR_PROJECT_FIT>>`: name the lab, group, department, or project focus.
- `<<SPECIFIC_RESEARCH_FOCUS_FROM_ADVERT>>`: use one or two concrete advert terms.
- `<<NEW_TOPIC_IF_RELEVANT>>`: mention only if honest, e.g. `mechanistic interpretability`.
- `<<PROJECT_METHOD_OR_IMPACT>>`: describe the method or impact without claiming prior experience not supported by the source files.

### Research Statement

- Use `templates/research_statement.tex` for research statements.
- The template uses an article-style layout rather than `moderncv`. This is intentional: it reads more like a paper and works better with numbered citations.
- Do not add a name/contact block at the top. The template is intentionally authorless and prints only the statement title and subtitle.
- Use normal LaTeX section levels for structure:
  - `\section{...}` for major parts.
  - `\subsection{...}` for project components.
  - `\subsubsection{...}` for detailed methods, evaluation, or contributions.
- Use `\cite{...}` for in-text numeric citations and `\bibitem{...}` entries in the `thebibliography` section.
- Use clickable source URLs in the bibliography entries with `\href{...}{...}`.
- Keep the tone concrete and research-focused: problem, research questions, method, evaluation, expected contribution, and fit with the group.
- Do not invent literature familiarity. Only cite papers, labs, tools, or methods that are explicitly supplied by the listing, profile files, user, or another inspected source.

#### Placeholder Guidance

- `<<POSITION_TITLE>>`: copy the advert title or use a concise project-specific subtitle.
- `<<RESEARCH_DIRECTION_OVERVIEW>>`: one short framing paragraph for the proposed direction.
- `<<MOTIVATION_AND_BACKGROUND>>`: connect relevant profile evidence to the research topic.
- `<<PROPOSED_PROJECT_OVERVIEW>>`: define the proposed PhD project within the advert scope.
- `<<RESEARCH_QUESTION_1>>` etc.: use concrete questions that can plausibly be studied during a PhD.
- `<<METHODOLOGICAL_APPROACH>>`: describe methods without overstating prior experience.
- `<<EVALUATION_PLAN>>`: state datasets, protocols, or evaluation criteria only when supported by the advert or supplied sources.
- `<<EXPECTED_CONTRIBUTIONS>>`: state likely scientific contributions in modest, testable terms.
- `<<GROUP_FIT>>`: connect the project to the named group, supervisors, department, or project.
- `<<SOURCE_N_TITLE>>`: use real source titles if you keep the old hyperlink list pattern. The current template instead uses numeric citations and `\bibitem` entries, so fill `ref1`, `ref2`, and `ref3` or replace them with your own citation keys.

## Final Checks Before Compiling

- Confirm all placeholders have been replaced.
- Confirm no unsupported facts were added.
- Confirm `cv.tex` compiles.
- Confirm `cover_letter.tex` compiles.
- Confirm `research_statement.tex` compiles if included in the application.
- Confirm the research statement does not print the name/contact block at the top.
- Confirm all source links in the research statement are clickable and point to real URLs.
- Confirm the information before the `\newpage` command is strictly one page or less.
  - If not, SHORTEN IT!
- Confirm the cover letter PDF is one page.
