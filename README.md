# kubectl-datree

## Overview 
The Datree CLI provides a policy enforcement solution to run automatic checks for rule violations in Kuberenetes configuration files.  
This plugin extends the Datree CLI's capabilities to allow scanning resources within your cluster for misconfigurations.  
To learn more about Datree, visit the [datree website](https://www.datree.io/).
<!--👉 **Docs:** [https://hub.datree.io/kubectl-plugin](https://hub.datree.io/kubectl-plugin/#utm_source=github&utm_medium=organic_oss) !-->

## Supported Platforms
This plugin supports **MacOS** and **Linux**.

## Installation
### Manual installation
1. [Download the installation script](https://github.com/datreeio/kubectl-datree/releases/latest/download/manual_install.sh) from this repository.
2. Open a terminal at the location of the script. 
3. Run ```/bin/sh manual_install.sh``` (an administrator password will be required to complete the installation).

## Usage
```
kubectl datree test [datree CLI args] -- [options]
```
**Arguments:**
```
datree CLI args:
  This plugin supports all of the Datree CLI arguments: https://hub.datree.io/cli-arguments

options:
  [--namespace <namespace>] Test all resources in the cluster belonging to the specified namespace
  [<resource type> <resource name> <namespace>] Test a single given resource in the cluster

  Running 'kubectl datree test' with no arguments is equivalent to 'kubectl datree test -- --namespace default'
```

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

## Examples
This command will fetch all resources within the namespace "exmpl", and execute a policy check against them:
```
kubectl datree test -- --namespace exmpl
```

This command will fetch the resource of kind "Service" named "myAwesomeService" in namespace "myCoolNamespace", and execute a policy check against it using k8s schema version 1.22.0:
```
kubectl datree test -s "1.22.0" -- service myAwesomeService myCoolNamespace
```
![](Resources/test_single_example.gif)
