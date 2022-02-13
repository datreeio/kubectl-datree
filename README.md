# kubectl-datree

## Overview 
[Datree](https://www.datree.io/) is a CLI tool that provides a policy enforcement solution to run automatic checks for rule violations in Kuberenetes configuration files.  
This plugin extends the Datree CLI's capabilities to allow scanning resources within your cluster.  

*Ensure your cluster is free from misconfigurations, and prepare it for the future by testing your resources against any k8s schema version!*
<br/><br/>
<!--👉 **Docs:** [https://hub.datree.io/kubectl-plugin](https://hub.datree.io/kubectl-plugin/#utm_source=github&utm_medium=organic_oss) !-->

## Supported Platforms
This plugin supports **MacOS** and **Linux**.
<br/><br/>

## Installation
### Via Krew
1. Install [krew](https://krew.sigs.k8s.io/docs/user-guide/setup/install/)
2. Install the datree plugin:
```
kubectl krew install datree
```
### Manual installation
1. [Download the installation script](https://github.com/datreeio/kubectl-datree/releases/latest/download/manual_install.sh) from this repository.
2. Open a terminal at the location of the script. 
3. Run ```/bin/sh manual_install.sh``` (an administrator password will be required to complete the installation).  

<br/>

## Usage
```
kubectl datree test [datree CLI args] -- [options]
```
**Arguments:**
```
datree CLI args:
  This plugin supports all of the Datree CLI arguments: https://hub.datree.io/cli-arguments

options:
  [-n <namespace>] Test all resources in the cluster belonging to the specified namespace
  [<resource type> <resource name> <namespace>] Test a single given resource in the cluster

  Running 'kubectl datree test' with no arguments is equivalent to 'kubectl datree test -- -n default'
```

<br/>

## Specification
The plugin supports the following resource types:
* pod
* service
* ingress
* daemonset
* deployment
* replicaset
* statefulset
* job
* cronjobs  

When running against a given namespace, only resources of these types will be checked.  

<br/>

## Examples
This command will fetch all resources within the namespace "exmpl", and execute a policy check against them:
```
kubectl datree test -- -n exmpl
```

This command will fetch the resource of kind "Service" named "myAwesomeService" in namespace "mySweetNamespace", and execute a policy check against it using k8s schema version 1.22.0:
```
kubectl datree test -s "1.22.0" -- service myAwesomeService mySweetNamespace
```  

<br/>

**Example test with no misconfigurations:**  
![](Resources/test_single_example.gif)
