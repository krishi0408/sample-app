# Python Sample Pipelines in Harness

## To Do

TO DO:
- [ ] Understanding the basics of Harness 
- [ ] Requirements
- [ ] Environment
- [ ] Steps to use the samples on Harness App
- [ ] Explain a bit on what the sample app does
- [ ] Other useful links
- [ ] License info
- [ ] [Harness Community - Communication Guide](https://github.com/harness-community/overview/blob/main/community_communication_guide.rst)

## Introduction
========================
This repository is a home for snippets of YAML code and a sample hello world server of scripting for the Harness CI Community.

## Layout

**[Tutorial](docs/tutorial.md)**<br>
**[Requirements](docs/requirements.md)**<br>
**[Harness Sample YAML](https://github.com/harness-community/python-pipeline-samples.git)**<br>
**[Getting Started](#GettingStarted)**<br>
**[Workflow](#Workflow)**<br>
**[Build Instructions](docs/build.md)**<br>

Getting Started

Use this README to get started with our sample pipeline repository for Python. This guide outlines the basics of getting started with the Harness CI and provides a full code sample for you to try out. This sample doesn’t include configuration options, for in depth steps and configuring the pipeline for example using triggers or using our templates see the Pipeline Configuration Docs.

Here we have build a simple two-stage CI Pipeline in Harness. Setting up and running the Pipeline will take about 30 minutes. The Pipeline will build and run a unit test on a sample nodejs repository upload the artifact to Docker Hub and then run integration tests. You can use publicly-available code, images, and your Github and Docker Hub accounts.

Workflow
1.Use a Kubernetes cluster build farm.
2.Build the code and run unit tests in the build farm.
3.Package the app as a Docker image and upload it to Docker Hub.
4.Pull the uploaded image to the build farm as a Background Task. Check out more about background tasks here
5.Run an integration test against the sample app.

Graphical Summary 

Docs

Pipeline Creation & Build Set-up
Configuring the infrastructure & setting up Build & Run Unit Test stage
Build & Push Image to Docker
Create Integration Stage
Execute the Pipeline

Licensing

MIT License
