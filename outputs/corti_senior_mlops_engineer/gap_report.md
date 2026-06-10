# Missing Fit / Gap Report

## Main Gaps Against The Listing

- **Pure MLOps / platform-engineering depth:** The repository supports production ML pipeline ownership and ML engineering, but not a dedicated senior DevOps or platform-engineering role.
- **Kubernetes:** The listing asks for container orchestration experience. The repository supports Docker, but not Kubernetes.
- **Infrastructure as code:** The listing names Terraform and Helm. Neither appears in the repository sources inspected.
- **CI/CD tooling:** The listing names GitHub Actions and ArgoCD. The repository now supports CI/CD pipeline experience and GitHub, but not the specific GitHub Actions or ArgoCD claims.
- **MLOps tools:** The listing names MLflow, Kubeflow, and DVC. The repository now supports MLflow, but not Kubeflow or DVC.
- **Model governance:** The listing asks for versioning, monitoring, drift detection, and reporting. The repository supports explainability and production ML, but not formal model governance or drift monitoring.
- **Observability and distributed-systems debugging:** The listing emphasises observability and distributed systems. The repository does not provide concrete evidence for observability tooling, incident response, SLOs, logs/metrics/traces, or distributed-systems debugging.
- **Security and compliance implementation:** Corti's domain makes compliance important, and the listing asks for security and compliance best practices. The repository does not support specific security, HIPAA, GDPR, ISO, medical-device, or regulated-infrastructure implementation claims.
- **Healthcare dialogue, speech, and documentation systems:** Corti's product context includes clinical dialogue, speech-to-text, documentation, coding, and agentic workflows. The repository supports healthcare AI and natural-language-input ML, but not direct speech, transcription, EHR, medical coding, or ambient documentation experience.
- **Scale:** Corti describes production healthcare infrastructure at large patient-interaction scale. The repository supports production ML systems, but not comparable scale.

## Strong But Partial Fits

- **Production ML systems:** Strong evidence from Valcon, Signum, Project Iris, and `profile/claims.yaml`.
- **Python and applied ML depth:** Strong evidence from `profile/skills.yaml`, KTH education, RaySearch, Signum, and Valcon.
- **Cloud/data platform exposure:** Supported through AWS, Azure, and Databricks.
- **Docker:** Supported in `profile/skills.yaml`.
- **MLflow:** Supported in `profile/skills.yaml`.
- **CI/CD pipelines:** Supported in `profile/skills.yaml`; the named tools GitHub Actions and ArgoCD remain unsupported.
- **Healthcare and pharma domain relevance:** Strong evidence from RaySearch and Signum.
- **Cross-functional work:** Supported through collaboration with clinicians, UX designers, sales representatives, business stakeholders, and non-technical stakeholders.
- **Mentoring/training:** Supported by Valcon mentoring and explainable AI/Git trainings.

## Items To Add Before Submitting If True

- Any Kubernetes experience, even if from side projects or internal deployments.
- Any Terraform, Helm, GitHub Actions, ArgoCD, Azure DevOps, or similar CI/CD/IaC work beyond generic CI/CD pipeline experience.
- Any Kubeflow, DVC, model registry, feature store, model versioning, or experiment tracking work beyond MLflow.
- Any monitoring, drift detection, dashboarding, logging, alerting, SLO, or incident-response experience.
- Any concrete security or compliance work, especially GDPR, healthcare, ISO, access controls, audit logging, or regulated deployments.
- Any data engineering work involving ETL pipelines, data lakes, batch processing, streaming, or orchestration.
- Any direct experience with clinical NLP, LLMs, speech-to-text, EHR integrations, medical coding, or healthcare documentation.
- Any links to code, portfolio material, or architecture writeups for Project Iris or resume_builder if they can be shared.

## Do Not Add Unless True

- Kubernetes, Terraform, Helm, GitHub Actions, ArgoCD, Kubeflow, or DVC experience.
- Formal model governance, drift detection, or monitoring implementation.
- Direct work with Corti, Symphony, NHS deployments, EHR vendors, or virtual care platforms.
- HIPAA, GDPR, ISO, medical-device, or other compliance implementation experience.
- Clinical credentials, regulatory ownership, publications, patents, or medical coding expertise.
