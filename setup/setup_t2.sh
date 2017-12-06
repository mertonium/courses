#!/bin/bash
#
# Configure a t2.xlarge instance
if [ $# -eq 0 ]; then
  awsProfile="default"
else
  awsProfile=$1
fi

# get the correct ami
export region=$(aws configure get region --profile $awsProfile)
if [ $region = "us-west-2" ]; then
   export ami="ami-f8fd5998" # Oregon
elif [ $region = "eu-west-1" ]; then
   export ami="ami-9e1a35ed" # Ireland
elif [ $region = "us-east-1" ]; then
  export ami="ami-9c5b438b" # Virginia
else
  echo "Only us-west-2 (Oregon), eu-west-1 (Ireland), and us-east-1 (Virginia) are currently supported"
  exit 1
fi

export instanceType="t2.xlarge"
export awsProfile

. $(dirname "$0")/setup_instance.sh
