# User-Query Module
This is the front-end module. It's developed in VueJS 3. 
# Instructions
* This template is created as a template. Selected this template when creating a new repository.
* Edit the .env file and adjust variables accordingly. You have to include the following variables:
- VUE_APP_GOOGLE_MAPS_KEY (it includes the GOOGLE MAPS KEY that you have to generate)
- API_URL (Url of the service to call with lat lang and get a prediction)
* Review Dockerfile to select the most appropriate image. Now we are using node:lts-alpine 
* Use make <COMMAND> to work with this repository:

```
make build
```
It builds the image in the local docker repository.
```
make run
```
It runs the application in the container. It's configured for hot reloading. Everytime you make a change in the code the app will refresh.
```
make logs
```
Outputs in the terminal the output of the application
```
make stop
```
Stop the application
```
make bash
```
Enter the command line of the image for debugging. Shouldn't need to do this very often
```
make auth
```
Authenticates gcloud and docker
```
make deploy
```
Deploys the application in the appropriate GCP Artifact repository. By defualt the repository should be named as the image created locally. IF it's not Make file should be modified.
