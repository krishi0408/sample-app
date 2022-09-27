In this tutorial you will learn how you can seamlessly get started with Harness CI for ```Python```. In this pipeline we will be implementing an Hello World Server in ```Python```.

### Step 1: Create your Harness Project

- Move to the Harness Platform & click on Project -> New Project
- Configure the project settings as below

  ```Name: (Default Project Name)```


  ```Organization: Default```

- Select CI Module in the modules sections


### Step 2: Pipeline Creation & Configure Stages

- Click on ```Pipelines``` -> Create a Pipeline 
- Configure the pipeline as below

  ```Name: CI-Python-Quickstart```

  ```Set up pipeline as: Inline```


To know more about Pipelines [check out the docs here](overview.md)

### Build Step

- Click on ```Add Stage``` to get started with the pipeline creation
- Select the type of stage as ```Build```
- Configure the Stage Settings as below

```Name: build test and run```

**Setup the Connector as follows**

Select ```Connectors``` -> Click on ```+ New Connector```

Connector Type: ```Github```

Name: ```python-sample-connector ```

URL Type : ```Repository```

Connection Type: ```HTTP```

GitHub Repository URL: Paste the link of your forked repository

Username: (Your Github Username)

Personal Access Token: [Check out how to create personal access token](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token)

Secret Name: ```Git-Token```

Secret  Value: PAT value generated in Github

Click on Save 

This will allow the repository to be fetched click on it and click ```Apply Selected```

Make Enable API access (ON) with the secret token created

Click on Connect through Harness Delegate. [Check out more on Harness Delegate](https://docs.harness.io/article/sjjik49xww-kubernetes-cluster-connector-settings-reference)

To develop more understanding on Connectors [check out the docs here](overview.md)

Then go to Execution (In this step we are going to compile the code)
#### Code Compilation
- Click on ```Add step``` 
 - Go to ```Build``` and click on ```Run```
 - Change the settings as following 
 - Name: ```Code compile```
 - Container Registry -> Choose ```New connector```
   - Click on ```Docker Registry```
   - Change the settings as following 
       - Overview 
         - Name- ```docker quickstart```
       - Details 
         - Docker registry url -  ```https://index.docker.io/v1/```
         - Provider type - ```Docker Hub``` 
         - Authentication - ```Username and Password```
         - Username - Docker hub username 
         - Secret Token - [Check out how to create docker PAT](Secret.md)
       - Connect to Provider 
         - Choose connect through harness delegate -> Select Harness delegate you created 
       - It will take sometime to verify your credentials.
  - Image:```python:3.10.6-alpine```
  - Shell: ```Sh```
  - Command:
 
    ```python3 -m venv venv```
   
    ```python -m compileall ./```
  - Then click ```Apply changes``` 
 
 ####  Image Creation             
 - Click on ```Add step```
   - Go to builds and click on run 
   - Change the settings as following:
   
      [ ] Name: ```create image``` 
      [ ]Container registry: Click on docker connecter created in the previous step 
      [ ]Image: ```alpine```
      [ ]Commands: Copy the following command and click on apply changes.
         
         touch pythondockerfile
         cat > pythondockerfile <<- EOM
         FROM python:3.10.6-alpine
         WORKDIR /py-sample-proj
         ADD . /py-sample-proj
         RUN pip install -r requirements.txt
         CMD ["python" , "app.py"]
         EOM
         cat pythondockerfile
      
 #### Build and Push Image to Docker Registry
 - Click on ```Add step```
 - Go to ```builds``` and click on ```build and push an image to docker registry```
 -  Change the settings as following:
    - Name: ```Build and push image to docker hub```
    - Docker connector: select the Docker connector you created previously 
    - Docker repository: ```<docker-hub-username>/<docker-repository name>```
    - Tags: ```latest```

### Integeration Testing 

    
    

     






