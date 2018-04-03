Run playbook like so:
ansible-playbook -vvv -i inventory/hosts playbooks/dokku-aws.yml -e @group_vars/all

NOTE: requires ansible 2.5 boto boto3
Edit the group_vars/all file and enter appropriate values for your AWS environment.

TODO: This playbook just gets the AWS EC2 instance running still requires apt upgrades and dokku install (ran out of time).

