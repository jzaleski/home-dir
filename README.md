home-dir
---

Dot-files and utilities

**Compatible with:**

* CentOS / Red Hat
* Cygwin
* Debian / Ubuntu
* Git Bash
* OSX

---

(_All of the following scripts will prompt before overwriting_)

**To bootstrap:**
```bash
bin/bootstrap.sh
```

**To bootstrap w/ additional packages:**

`EXTENDED_BOOTSTRAP=true bin/bootstrap.sh`

## Running containerized

(_Requires `docker`_)

**Building an image:**
```bash
docker/build.sh
```
**Starting a container (it will be removed on exit):**
```bash
docker/start.sh
```

**Stopping a running container:**
```bash
docker/stop.sh
```

**Connecting to a shell session:**
```bash
docker/shell.sh
```

**Viewing the log(s):**
```bash
docker/logs.sh
```

**Tail[ing] the log(s):**
```bash
docker/tail.sh
```

