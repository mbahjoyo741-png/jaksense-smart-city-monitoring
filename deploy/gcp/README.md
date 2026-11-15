# Deploy JakSense ke Google Cloud Run

Region yang dipakai adalah **asia-southeast2 (Jakarta)**, sesuai dokumen desain (data residency).

## Persiapan (sekali saja)

```bash
gcloud config set project <PROJECT_ID>
gcloud services enable run.googleapis.com artifactregistry.googleapis.com cloudbuild.googleapis.com
gcloud artifacts repositories create scms --repository-format=docker --location=asia-southeast2
```

## Deploy

Ada dua cara.

**Lewat Cloud Build** (build dan deploy sekaligus):

```bash
gcloud builds submit --config deploy/gcp/cloudbuild.yaml \
  --substitutions=SHORT_SHA=$(git rev-parse --short HEAD) .
```

**Langsung dari source** (lebih sederhana):

```bash
gcloud run deploy jaksense --source . --region asia-southeast2 --port 8080 --allow-unauthenticated
```

Setelah selesai, `gcloud` menampilkan URL layanan (`https://jaksense-xxxxx-et.a.run.app`).
