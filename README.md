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
git clone git://github.com/comotion/gone.git && cd gone && ./apply
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
#!/bin/sh
# ./apply - top-level configuration
# ./host/foo.bar/files/ ....
# ./host/baz.bar/files/ ....

# Catalogs is read by ./gone script
catalogs="modules host"
modules="basesys sshd ossec"
host=$(hostname -f)

./gone apply $@
```

`gone` expands the value of each element in `$catalogs` and appends
the value. The above example will expand to
`modules/basesys modules/sshd modules/sshd host/$(hostname -f)`

```bash
./apply will run the package
```

## Todo
Idempotence. "do $foo only when $bar got updated"
libs for:
    package installation on any distro
    service initscript installation
    checking configuration
.. might make it easier to write scripts, but
scripts will no longer stand alone!
