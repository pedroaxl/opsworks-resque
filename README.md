# opsworks-resque cookbook

This is a very simple cookbook to deploy a pool of resque workers directly in Amazon OpsWorks

# Requirements

# Usage

In your custom layer, you must add this recipes to each stage

**Configure
rails::configure
opsworks-resque::configure

**Deploy**
deploy::rails
opsworks-resque::restart

**Shutdown**
opsworks-resque::stop

# Attributes

It expects an array with the queues of workers to run, for example
```ruby
default['resque']['path'] = "/srv/www/mailee_staging/current"
default['resque']['workers'] = ['*', '*', '*'] # 3 workers with queue *
default['resque']['workers'] = ['imports', 'cache'] # 2 workers with queues imports and cache
default['resque']['rails_env'] = "preproduction"

```

# Recipes

**opsworks-resque::configure** - initial setup
**opsworks-resque::restart** - restart the workers (after deploy)
**opsworks-resque::stop** - stop the workers (shutdown)

# Author

Author:: Pedro Axelrud (<pedroaxl@gmail.com>)
