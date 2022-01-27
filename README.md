# kubectl-datree

## Overview
This plugin extends the Datree CLI's capabilities to allow scanning kubernetes manifest files within the cluster for misconfigurations.
👉 **Docs:** [https://hub.datree.io/kubectl-plugin](https://hub.datree.io/kubectl-plugin/#utm_source=github&utm_medium=organic_oss)

## Supported Platforms
This plugin supports MacOS and Linux.

## Installation
### Via Krew
1. Install [krew](https://krew.sigs.k8s.io/docs/user-guide/setup/install/)
2. Install the datree plugin:
```
kubectl krew install datree
```

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

This command will fetch the resource of kind "Service" named "myAwesomeService", and execute a policy check it:
```
kubectl datree audit -- service myAwesomeService
```

