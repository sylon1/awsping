#!/bin/sh
cat ./ssh_key > ~/.ssh/demo-key-pair.pub
aws ec2 describe-regions | jq ".Regions[].RegionName" | xargs -i aws ec2 import-key-pair --key-name "demo-key-pair" --public-key-material file://~/.ssh/demo-key-pair.pub --region {}
