# opsworks-resque cookbook

This is a very simple cookbook to deploy a pool of resque workers directly in Amazon OpsWorks

# Requirements

# Usage

In your custom layer, you must add this recipes to each stage

**Setup**

opsworks-resque::setup

**Deploy**

opsworks-resque::restart

**Undeploy**

opsworks-resque::stop

# Attributes

It expects an array with the queues of workers to run, for example
```json
"resque": {
  "app-name": {
    "workers": {
      "*": 1
    }
  }
}
```

# Recipes

**opsworks-resque::setup** - initial setup
**opsworks-resque::restart** - restart the workers (after deploy)
**opsworks-resque::stop** - stop the workers (shutdown)

# Author

Author:: Pedro Axelrud (<pedroaxl@gmail.com>)