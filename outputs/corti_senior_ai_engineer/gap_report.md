# Missing Fit / Gap Report

## Main Gaps Against The Listing

- **Direct production RAG:** The profile supports embeddings, vector search, semantic similarity, and RAG-adjacent retrieval work, but not a full production RAG architecture.
- **LLM fine-tuning and post-training:** No profile source supports training, fine-tuning, or post-training transformer-based models.
- **Production LLM inference services:** The profile supports production ML systems, but not operating low-latency LLM inference services or NVIDIA Triton.
- **Formal LLM and agent evaluation frameworks:** `resume_builder3` supports evidence mapping and gap reports, and the profile supports evaluation-minded ML work, but not a dedicated LLM/agent benchmark or human-evaluation framework.
- **Clinical NLP:** RaySearch supports medical AI and clinical workflow collaboration, and Valcon supports natural-language inputs, but the profile does not show clinical NLP, EHR, medical coding, speech-to-text, or patient-dialogue modelling.
- **Go, Kubernetes, Kafka, and Triton:** These are mentioned by Corti. The profile supports Python, FastAPI, Docker, cloud platforms, and CI/CD pipelines, but not Go, Kubernetes, Kafka, or NVIDIA Triton.
- **Privacy and safety implementation:** The profile supports high-stakes healthcare AI experience, but not concrete privacy, safety, compliance, or regulated clinical-data infrastructure implementation.

## Strong Adjacent Fit

- Current LLM embedding work at Signum for free-text similarity search and matching workflows.
- Project Iris with OpenCLIP embeddings, Qdrant vector search, FastAPI, MongoDB, scraping, and a browser extension.
- `resume_builder3` as a source-grounded, human-in-the-loop agentic workflow with evidence mapping and gap reporting.
- Production ML ownership at Signum and Valcon.
- Medical AI and clinician collaboration from RaySearch.
- Strong Python, ML, statistics, and engineering background from KTH.
- Cross-functional communication across product, engineering, stakeholders, UX designers, clinicians, and medical physicists.

## Items To Add Before Submitting If True

- Any direct RAG system implementation, including chunking, retrieval, reranking, answer synthesis, or evaluation.
- Any LLM fine-tuning, post-training, prompt evaluation, or production inference work.
- Any formal evaluation framework for agents, generative systems, retrieval quality, or human review.
- Any Kubernetes, Go, Kafka, Triton, or distributed inference experience.
- Any clinical NLP, EHR, speech-to-text, medical coding, privacy, safety, GDPR, or healthcare compliance implementation.
- Any shareable links or demos for Project Iris or `resume_builder3`.

## Do Not Add Unless True

- Direct work with Corti, Symphony, NHS deployments, EHR vendors, or virtual care platforms.
- Direct clinical NLP, speech recognition, transcription, or medical coding expertise.
- Transformer fine-tuning, post-training, or production LLM serving ownership.
- Kubernetes, Go, Kafka, or Triton experience.
- Claims about model-quality, latency, cost, or evaluation improvements that are not documented.

