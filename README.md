# A Taos AWS+Jenkins (TAJ) project


## Purpose

The purpose of this project is to give Taos Bootcampers the opportunity to work with many different concepts and technologies. This project will use Amazon Web Services (AWS) as its cloud provider though the primary concepts are easily transferable to any Cloud provider.

In this project you will implement a simple Kubernetes cluster running a simple web application (Python Flask). The webserver will run Nginx. A Jenkins server will be used to set up and orchestrate the deployment of the cluster at scale. Docker will be used for the containers


## Prompt

### Week 1

Our goal is to learn more about setting up and deploying a Kubernetes cluster running Jenkins on EC2. This will be done using a tool called `kops` by creating one pod running three free-tier nodes.

We will want our architecture to be within a VPC for security and performance reasons. Within that VPC we will include a developer (dev) server that the engineer can use to freely engineer without fear of affecting their physical machine. We will setup the Kubernetes cluster on top of which we will build our application. Before we build our application we will setup a container running Jenkins that will allow us to leverage Continuous Delivery (CD).

---

> Go to the AWS website and create yourself a dev server. You do not have to spin up anything that is fancy, just something that will allow you to compartmentalize development for this project.

- [ ] Create an AWS account
- [ ] Create a dev server
..- [ ] Launch an EC2 instance
..- [ ] Select Amazon Linux 2 AMI
..- [ ] Select t2.micro instance type
..- [ ] Continue with setup

---

> Setup a VPC in AWS. Try to do this without using the setup wizard. There are a bunch of pieces thats the wizard does without telling you. Setting up manually will help you to learn about the various components needed for a VPC to work. Msot of these are components that only need to be set up once for the lifetime of the VPC, so you probably won't encounter them often but knowing about them can help with troubleshooting later on. Setting up a VPC in AWS was another project in the Taos curriculum. Contact staff for details.

* Go to AWS VPC Dashboard
* Click "VPC's" under resources
* CLick "Create VPC"
* Create a subnet
* Create a route table
* Create an internet gateway
* Configure DHCP options
* ACL
* Security groups

---

> Create a Kubernetes cluster in AWS

- [ ] Install [`kubectl`](https://kubernetes.io/docs/tasks/tools/install-kubectl/)
..* I used the method of "Install kubectl binary using native package management" under the "CentOS, RHEL or Fedora" tab. I also changed the `repo_gpgcheck=1` to `repo_gpgcheck=0` according to a Github issue that I had found because I wasn't able to install kubectl with the method provided. A more suitable fix should be posted ASAP.

- [ ] Install [`kops`](https://kubernetes.io/docks/getting-started-guides/kops/)
https://kubernetes.io/docs/getting-started-guides/kops/
..* I had to use sudo to install `kops` using the listed procedure for Linux installation.

- [ ] Create a Route 53 domain for the cluster
https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/CreatingNewSubdomain.html

- [ ] Create an S3 bucket to store the state of the cluster
- [ ] Build the cluster configuration
- [ ] Create the cluster

---

> Deploy and configure Jenkins

* [A git repo containing configuration files for Jenkins in YAML](https://github.com/kumorilabs/getting-to-know-k8s/tree/master/kubernetes/jenkins)
..* You can use this for reference; however, to get the most out of this exercise, you should architect for the free tier, and come up with your own configuration

- [ ] Create a Route53 domain for Jenkins and unlock the Jenkins server
- [ ] Retrieve the admin password from /var/jenkins_home /secrets/initialAdminPassword
- [ ] Install the suggested plugins
- [ ] Change the admin password to something you’ll remember
- [ ] Install and configure the Kubernetes Jenkins plugin


---


### Week 2

This week's project will focus on customizing your Jenkins deployment as well as Dockerizing the image.

> Test the deployment by creating a test pipeline.

> Copy config.xml, users, jobs, secrets, and plugins to your local machine

> Write a Dockerfile that first copies these files to their appropriate directories in /usr/share/jenkins/ref and then runs plugins.sh, and the Jenkins upgrade wizard.

> Build the image and push to Dockerhub

> Delete the cluster

> Delete the S3 bucket
