# Exposed AWS Keys Repo
For anyone stubmling across this repo, I have intentionally exposed some AWS access & secret keys.  This repo is designed as a lab/experiment to test the AWS health dashboards in the AWS console that should alert me that the keys have been exposed. 🚨 **DO NOT ATTEMPT THIS YOURSELF** 🚨

There's no need to reach out to me that these keys are exposed.

If you do decide to attempt this yourself, you should 🚨 **use it at your own risk** 🚨.

## Why Am I doing something so crazy? 🤪
AWS proactively monitors popular code repository sites for IAM access keys that have been publicly exposed. Upon detection of an exposed IAM access key, AWS Health generates an AWS_RISK_CREDENTIALS_EXPOSED event in the AWS account related to the exposed key.

I'm conducting this experiment 🧪 because I want to test first hand how this works, vs just a simulation of raising the event internally.  I plan on making a video of this so anyone who is interested can see how this works without exposing themselves in the process. 🤞 WISH ME LUCK!!! 🍀


1. Part 1 of this will be to test the AWS Health Dashboard notices and timing.  While AWS doesn't guarentee anything with these notices, I'm interested to find out how long it will take (learn & be curious).
1. Part 2 of this will be to use the step functions process to delete the exposed keys (later this week / or weekend)


## Part 1 (complete)  ✅
The cloudformation template will create a user and two groups.  The "user" is a DevOps Trainee who is just learning the ways of the cloud.  There are two groups:
1. The DevOpsInTraining group used to give a user access to only their predefined bucket
1. There is also a `SecurityRiskGroup`, which can be used to isolate any user that has been deemed a security risk. This Group will apply the `AWSDenyAll` policy, which will explicitly Deny any resources to any user being part of this group.  The explicity Deny will override any other `Allow` actions granted.  This essentially locks the user out.

The CloudFormation template, makes it easy to:
1. Create a user
1. Create Groups
1. Define the Policies for the Groups
1. Create an S3 bucket to test the policies
1. Assign the user to the DevOpsInTraining Group
1. Select if the user is a security risk, which then adds them to the `SecurityRiskGroup`, which locks them out.
1. ... and last but definitely not least, using CloudFormation will allow me to destroy all the resources (along with the user and keys) when I'm done! 

By `Default` and for safety, I'm adding them to the `SecurityRiskGroup` group.

I have a script that can test if the user has access or not, and it is exposing `live` AWS Keys, however by the time you read this the user has been applied to the `SecurityRiskGroup` group, which locks them out.



## Part 2 (TODO) 🚧
This is a `TODO` item
Part 2 will be based off of this blog:
https://aws.amazon.com/blogs/compute/automate-your-it-operations-using-aws-step-functions-and-amazon-cloudwatch-events/


## 🚨 🚨 WARNINGS 🚨 🚨
1. This is highly insecure and you shouldn't do this.  I'll be creating a video of this so you can save yourself the trouble and just watch the video
1. The CloudFormation template has outputs that will display the security keys.  This should never be done and is only occuring for ease of use with this experiment.