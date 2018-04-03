RESOURCES:
1). Github Repo: https://github.com/eoriddlegh/r3pi-devopsassessment

2). Install the Jenkins/blueocean docker image for CICD.  https://hub.docker.com/r/jenkinsci/blueocean


Original code with some changes are in item 1.
  -- changes had to move sample-node-app subfolder to top level for Dokku to recognize Procfile and Dockerfile presence.
  -- Added folder ./ansibleOnAWS and ./build
  -- Added files ./Dockerfile and ./Jenkinsfile

Tooling:
	Ansible with boto and boto3 for the ec2 and ec2_group AWS modules

Setting all this up took much longer than the 4 - 6 hours for this test.

Thanks
Enrique Riddle
(972) 396-0633
enriqueo.riddle@outlook.com


