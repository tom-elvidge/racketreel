# Deployment

Install `gcloud` and login.

```sh
gcloud auth login
```

I have already created a project in with the id `tomelvidge` for POC projects so set this as the current project.

```sh
gcloud config set project tomelvidge
```

Deploy the application to Cloud Run from source.

```sh
gcloud run deploy racketreel-matches \
	--source=./ \
	--region=europe-west1 \
	--min-instances=0 \
	--max-instances=4 \
	--allow-unauthenticated \
	--set-env-vars='DatabaseConfig__Host'='...','DatabaseConfig__Port'='...','DatabaseConfig__Username'='...','DatabaseConfig__Password'='...','DatabaseConfig__Database'='...','AuthConfig__Authority'='...','AuthConfig__Audience'='...'
```