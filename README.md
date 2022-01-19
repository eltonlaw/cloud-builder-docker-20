# cloud-builder-docker-20

Google cloud build docker image with Docker 20

Fork from https://github.com/GoogleCloudPlatform/cloud-builders/tree/master/docker

Assuming you have credentials, build and deplay to GCR

By default it builds and deploys Docker CE 20.10.12, so just running this should be enough:

```
gcloud builds submit
```

and referencing that image in other `cloudbuild.yml`s is just:

```
- name: 'gcr.io/$PROJECT_ID/docker'
```

To build with other docker versions:

```
gcloud builds submit --substitutions=_DOCKER_VERSION="20.10.11"
```

And to see what versions are available:

```
docker build -t run-showpkg --target showpkg . && docker run run-showpkg
...
Provides
5:20.10.12~3-0~ubuntu-focal -
5:20.10.11~3-0~ubuntu-focal -
5:20.10.10~3-0~ubuntu-focal -
5:20.10.9~3-0~ubuntu-focal -
5:20.10.8~3-0~ubuntu-focal -
5:20.10.7~3-0~ubuntu-focal -
5:20.10.6~3-0~ubuntu-focal -
5:20.10.5~3-0~ubuntu-focal -
5:20.10.4~3-0~ubuntu-focal -
5:20.10.3~3-0~ubuntu-focal -
5:20.10.2~3-0~ubuntu-focal -
5:20.10.1~3-0~ubuntu-focal -
5:20.10.0~3-0~ubuntu-focal -
5:19.03.15~3-0~ubuntu-focal -
5:19.03.14~3-0~ubuntu-focal -
5:19.03.13~3-0~ubuntu-focal -
5:19.03.12~3-0~ubuntu-focal -
5:19.03.11~3-0~ubuntu-focal -
5:19.03.10~3-0~ubuntu-focal -
5:19.03.9~3-0~ubuntu-focal -
```
