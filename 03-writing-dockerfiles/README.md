# Writing our first Dockerfiles

To dockerize Applications it's often needed and recommended to create your own Dockerfiles with all required dependencies and configurations

## Exercise #1: Create Hello World Dockerfile
Surving static HTML over docker with a custom `Dockerfile`

* create a Dockerfile inside the `01_exercise` folder
* use `nginx:alpine` as base image
* `COPY` the content of `hello_world` into the container under `/usr/share/nginx/html`
* `EXPOSE` the port `80`
* Build the `Dockerfile` within the `01_exercise` folder with a build context relative to this folder `.` and a tag of `hello-world`
* Run the `hello-world` image and bind the `80` port to localhost
* Autoremove after container exit