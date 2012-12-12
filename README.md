# DESCRIPTION #

Configure plugins for the [collectd](http://collectd.org/) monitoring daemon.

# REQUIREMENTS #

This cookbook has only been tested on Ubuntu 10.04.

# USAGE #

A number of recipes for standard plugins are available:

* `collectd_plugins::rrdtool` - Output to RRD database files.
* `collectd_plugins::syslog` Log errors to syslog.
* `collectd_plugins::cpu` - CPU usage.
* `collectd_plugins::df` - Free space on disks.
* `collectd_plugins::disk` - Disk I/O operations.
* `collectd_plugins::interface` - Network I/O operations.
* `collectd_plugins::memory` - Memory usage.
* `collectd_plugins::swap` - Swap file usage.

It is recommended to always enable the first two (rrdtool and syslog), but the others are entirely optional. For convenience, the `collectd_plugins` default recipe will include all of these.

# ATTRIBUTES #

Several of the plugins use host attributes to control behavior.

## df plugin ##
* `node['collectd_plugins']['df']['selected_fstypes']` - array of filesystem types to monitor or ignore.  If `'ignore_selected'` is true (default), this is a list of ignored types, and if it's false, it's a whitelist.  The default value is `["proc", "sysfs", "fusectl", "debugfs", "securityfs", "devtmpfs", "devpts", "tmpfs"]`.
* `node['collectd_plugins']['df']['ignore_selected']` - boolean value; if true, use the `'selected_fstypes'` attribute as a blacklist; if false, treat `'selected_fstypes'` as a whitelist.  The default is true.
* `node['collectd_plugins']['df']['report_reserved']` - boolean value; controls if we measure reserved space on the filesystem.  Defaults to false.
* `node['collectd_plugins']['df']['report_inodes']` - boolean value; controls if we measure inode counts on the filesystem.  Defaults to false.

## syslog plugin ##
* `node['collectd_plugins']['syslog']['log_level']` - string; syslog priority used.  Allowable values are: emerg, alert, crit, err, warning, notice, info, debug.  Default is 'info'.

## interface plugin ##
* `node['collectd_plugins']['interface']['selected_interfaces']` - array of network interfaces to monitor or ignore.  If `'ignore_selected'` is true (default), this is a list of ignored types, and if it's false, it's a whitelist.  The default value is `[ "lo" ]`.
* `node['collectd_plugins']['interface']['ignore_selected']` - boolean value; if true, use the `'selected_interfaces'` attribute as a blacklist; if false, treat `'selected_fstypes'` as a whitelist.  The default is true.

## Redis ##

A plugin to monitor [Redis](http://redis.io/) is included as `collectd_plugins::redis`. This recipe requires that you be using our [redis cookbook](https://github.com/AtariTech/cookbooks/tree/master/redis)
for your servers, but can be trivially modified to look for a different recipe or role name.

# LICENSE & AUTHOR #

Author:: Noah Kantrowitz (<noah@coderanger.net>)
Copyright:: 2010, Atari, Inc

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
