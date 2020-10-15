# cis-baseline

This cookbook is another sample related to the Chef-Jenkins-Library project.

This cookbook is primarily used for demonstrating Chef/InSpec/Automate. Start with the  `sysctl.conf.erb` commented out. This cookbook is generally included in the demo with `all_systems`/`lab_base`. Deploy a node with one of these wrapper cookbooks and wait for it to report to Automate. Uncomment the lines in `sysctl.conf.erb`, then deploy an updated version of `cis-baseline`. Once the node runs `chef-client`, view the changes to the compliance state in Automate.
