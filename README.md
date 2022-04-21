# F5 SSL Orchestrator API Lab Environment

This simple respository contains a dockerfile to create a container environment for Terraform/Ansible/AWS automation.

To use:

- Create an empty local folder and copy the **dockerfile** and **ansible-init.sh** files there.

- Build the docker image:
  ```
  docker build -t f5labs/sslo-lab:1 .
  ```
  
- Create a container from that image:
  ```
  mkdir code
  docker run -it --name sslo-lab -v $(pwd)/code:/code f5labs/sslo-lab:1
  ```

- Inside the running container shell, initialize an Ansible environment
  ```
  cd /code
  ansible-init
  ```
