# **Finalizer Cleanup**

This script automatically deletes all Finalizer entries in all Pod Specs of a defined namespace.
> **Important:** This script has been created only for the described purpose. The usage should be evaluated beforehand. 

## **Prerequisites**
* `kubectl` is installed on the executing system
* `jq` is installed on the executing system
* connection to the target cluster is established

## **Usage**
Connect to the cluster and execute script

```bash
# set the target namespace as argument
bash cleanup.sh my_namespace
```
