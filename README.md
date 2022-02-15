# REXX Utilities

REXX project with utilities to help with REXX development.

## Installation

1. `git clone`
2. `npm install`
3. create `config/local.json` like [`config/default.json`](./config/default.json)
4. `zowe config secure` or create `zowe.config.user.json` like [`zowe.config.json`](./zowe.config.json) with user & password & account

## Usage

Add dynamic allocation or other TSO commands needed in the address space to `cmd.txt`, e.g.:

```txt
allocate file(myexec) dsn('ibmuser.rexx') shr
concat file(sysexec myexec)
```

Run [`setup`](#setup) then `ex dsn(member)`.  This creates a `cmd.txt` file (which is `.gitignore`ed) to keep track of
an active TSO servlet.

### setup.bat

[`setup`](./setup.bat) starts TSO address space and keeps it running.

### send.bat

[`ex`](./ex.bad) wraps running TSO commands via `zowe` against a TSO address space started via `setup`.
