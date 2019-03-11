home_dir
---

Dot-files and basic utilities

===

*Compatible with:*

- CentOS / Red Hat
- Cygwin
- Debian / Ubuntu
- Git Bash
- OSX

===

_All of the following scripts will prompt before over-writing anything_

To bootstrap:

`bin/bootstrap.sh`

To bootstrap w/ additional packages:

`EXTENDED_BOOTSTRAP=true bin/bootstrap.sh`

To bootstrap & configure the desktop environment:

`BOOTSTRAP_DESKTOP_ENVIRONMENT=true bin/bootstrap.sh`

===

*Running containerized (requires `docker`):*

Building the container-image:

`bin/build-container-image.sh`

Starting the container:

`bin/start-container.sh`

Connecting to the running container:

`bin/container-shell.sh`

Stopping the running container:

`bin/stop-container.sh`
