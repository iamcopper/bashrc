#### install_xxx
These are to install different component.
It can be install to call the install.sh in its directory.

#### setup_env.sh
Set bash evn script, should called from .bashrc when bash startup.
It can support several parameters to setup different component environment.

usage:
```
setup_env.sh \
	[git] \
	[vim] \
	[go] \
	[proxy] \
	[ipmitool] \
	[ipmicore]
```

#### setup_ipmicore_env.sh
Like setup_env.sh, but it's only for ipmicore build environment.
