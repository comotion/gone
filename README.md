# gone configuration management
basic idea:
 - rsync + shell scripts + git.
... and I didn't even need rsync!

Puppet exists. Chef exists. CFEngine exists. Slaughter exists.
However:
I want to depend on nothing but git.
I want to decentralise the "master".
I want my scripts to be standalone.

## Introducing the gone system:
**Install and run**
```bash
git clone git://github.com/comotion/gone.git && cd gone && ./gone apply
```

Works by having several _packages_ that can be applied to a system.
Each _package_ contains atleast a `./apply` script or some files to
sync. To make life easier each _package_ is contained within a
_catalog_, by default only the `modules` _catalog_ is distributed
with gone. You can add any _catalog_ you want, typically you will
have one catalog containing host specific configuration or roles.

## Example

**Install a base system and some host specific configurations:**

```bash
./apply
--------------------------------------------------------------------
#!/bin/sh
# All the files you need to sync is in `modules/base` and host
# specifics are in `host/<hostnane>`. You can run ./apply to run the
applicances.

# Catalogs is read by ./gone script
./gone apply ${@:-modules/base host/$(hostname)}
```

Any appliance can be one of 1) a script, 2) a folder containing any
one of `./files/` or `./apply`. It can be structured any way you like.



## Todo
Idempotence. "do $foo only when $bar got updated"
libs for:
    package installation on any distro
    service initscript installation
    checking configuration
.. might make it easier to write scripts, but
scripts will no longer stand alone!
