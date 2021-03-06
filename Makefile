.SHELL := /bin/bash
PLAN=.terraform/redis-terraform.tfplan 
PLAN_FI=.terraform/redis-terraform-fi.tfplan 
default: help

init: 
	terraform init 

plan:
	terraform plan \
	-var-file=terraform.tfvars \
	-out $(PLAN)

plan_fi:
	terraform plan \
	-var-file=terraform.tfvars \
	-out $(PLAN_FI)


apply: plan
	terraform apply $(PLAN)

apply_fi: plan_fi
	terraform apply $(PLAN_FI)

destroy:
	terraform destroy

clean:
	rm -rf .terraform