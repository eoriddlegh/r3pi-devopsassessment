# r3pi-devopsassessment
R3PI devopsassessment repository.  Test for a devops position at R3PI

Instructions are:
DevOps Assesment Task
The goal of the exercise is to setup all the infrastructure necessary to support the continuous deployment of a NodeJS app. We will be using a public cloud, a Heroku-style PaaS name Dokku and a variety of provisioning and Infrastructure-as-code tools.

Task 1. Setup Dokku*
First you will need to deploy Dokku on a public cloud provider of your choice, we prefer AWS, but GCE, Digital Ocean or Azure are also ok. Use infrastructure-as-code tools to set it up, we suggest Terraform, but Cloudformation, Ansible or others are also accepted.
  SEE: ./ansibleOnAWS
    DELAYS:  
      - Dokku not a nice install on AWS EC2 instance.  default ssh-keys not generated correctly.
      - First time using ansible with AWS EC2 modules and the battle of boto and boto3 running together.  ARRRGGGH.
    TODO: install dokku and set it up.  I set this up manually

Task 2. Deploy the NodeJS app
To get a first taste of Dokku, manually deploy the application as provided (using buildpacks).
Create a Dockerfile for the app (be mindful of container size).
Deploy the app again, now making sure Dokku uses the Dockerfile.
  SEE: Dockerfile
    DELAYS: Running docker on windows 10 pro.  New personal computer headaches.  Turned off Experimental Features to finally get it to work.

Task 3. Set up CI/CD pipelines
Set up a continuous deployment pipeline using a public service like Travis CI, Circle CI or feel free to launch one on your own using Concourse CI or Jenkins for example.
  SEE: ./build/Jenkinsfile
    BLOCKER: git push dokku master workaround difficult inside Jenkins jobs.  Not completed.
    The ./build/Jenkinsfile is a sample file that when above BLOCKERS if solved it should work.

(Optional) Task 4. Propose the ideal CD pipeline
After implementing a successful pipeline describe what in your view would be the ideal CD pipeline. Touch briefly (maximum 2 pages) on each of the following points:

Branching strategy
Test stages
Versioning
Environments
Fan-in/ Fan-out stages
Continuous Delivery or Continuous Deployment
Release Strategy
Deliverables
A github, gitlab or bitbucket repo with the code to create all of the above.
Documentation on how to apply it (it should be brief)
CD pipeline discussion (if done)
Estimated time to complete: 4 to 6 hours
