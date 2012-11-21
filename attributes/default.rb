# list of filesystem types to monitor (or ignore) for the df plugin
# if ignore_selected is true, it's a blacklist; if ignore_selected is false, it's a whitelist
default['collectd_plugins']['df']['selected_fstypes'] = ["proc", "sysfs", "fusectl", "debugfs", "securityfs", "devtmpfs", "devpts", "tmpfs"]
default['collectd_plugins']['df']['ignore_selected'] = true
# report reserved space and inode counts
default['collectd_plugins']['df']['report_reserved'] = false
default['collectd_plugins']['df']['report_inodes'] = false

# allowable: emerg, alert, crit, err, warning, notice, info, debug
default['collectd_plugins']['syslog']['log_level'] = "info"

# list of network interfaces to monitor (or ignore) for the interface plugin
# if ignore_selected is true, it's a blacklist; if ignore_selected is false, it's a whitelist
default['collectd_plugins']['interface']['selected_interfaces'] = ["lo"]
default['collectd_plugins']['interface']['ignore_selected'] = true
