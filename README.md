# kubectl-datree

## Overview
This plugin extends the Datree CLI's capabilities to allow scanning kubernetes manifest files within the cluster for misconfigurations.  
👉 **Docs:** [https://hub.datree.io/kubectl-plugin](https://hub.datree.io/kubectl-plugin/#utm_source=github&utm_medium=organic_oss)

## Prerequisites
In order to use this plugin, the Datree CLI needs to be installed.  
One-line installation can be found here: [Getting started](https://hub.datree.io/)

## Supported Platforms
This plugin supports **MacOS** and **Linux**.

## Installation
### Manual installation
1. Download the latest release from this repository.
2. Unzip, then copy "kubectl-datree" to any directory in your $PATH (for example - /usr/local/bin/).

## Usage
```
kubectl datree audit [datree CLI args] -- [options]
```
**Arguments:**
```
datree CLI args:
  This plugin supports all of the Datree CLI arguments: https://hub.datree.io/cli-arguments

options:
  [--namespace <namespace>] Test all resources in the cluster belonging to the specified namespace
  [<resource type> <resource name>] Test a single given resource in the cluster

  Running 'kubectl datree audit' with no arguments is equivalent to 'kubectl datree audit -- --namespace default'
```

## Examples
This command will fetch all resources within the namespace "exmpl", and execute a policy check against them using k8s schema version 1.22.0:
```
kubectl datree audit -s "1.22.0" -- --namespace exmpl
```

This command will fetch the resource of kind "Service" named "myAwesomeService", and execute a policy check against it:
```
kubectl datree audit -- service myAwesomeService
```

