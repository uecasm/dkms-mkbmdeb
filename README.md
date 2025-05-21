This is a script intended to perform the functions of `dkms mkbmdeb` (i.e. generate an installable package from a DKMS build that contains only the binary kernel modules, not the original sources).

It was made after the maintainers of dkms decided they didn't want to include this functionality natively any more -- but I consider it super valuable for certain scenarios, such as building a custom driver from a development image and then installing it in a runtime image that lacks compilers required by dkms itself.

I have no plans to replicate the `dkms mkdeb` functionality -- for transferring source files from one DKMS-enabled system to another you should make your own real package and install that in both systems, or use `dkms mktarball` and `dkms ldtarball` respectively.

This script requires that you have installed the usual Debian package development packages (namely `fakeroot`, `dpkg-dev`, and `debhelper`, which you can easily install with `devscripts`), along with `dkms`, of course.  Unlike `dkms` itself, you do not need to run this as root.

Since it uses the same templates as `dkms` did, this means that any driver packages which customised their templates should theoretically still work as before.  More specifics on how templates work is given in the manpage.

# Installation

No installation is required; you can just clone/untar somewhere convenient and then run the script directly.

However, if you want to install, then simply run `sudo ./install.sh` to install to `/usr/local` or `sudo prefix=/usr ./install.sh` to install to `/usr`.

An uninstaller isn't provided but you can just read the script and delete the files it installed.  Or perhaps at some point an enterprising soul will package this.

# Usage

Basically the same as before, just replace `dkms mkbmdeb` with `[/path/to/]dkms-mkbmdeb`.

See the manpage for more usage detail and some examples: `man [/path/to/]dkms-mkbmdeb` (path required if not installed).

Note that currently the `--all` option is not supported; either specify the desired kernel versions explicitly or let it default to your current version.

