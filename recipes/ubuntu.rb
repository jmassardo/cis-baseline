#
# Cookbook:: cis-baseline
# Recipe:: ubuntu
#
# Copyright:: 2018, The Authors, All Rights Reserved.

package 'auditd'

template '/etc/audit/auditd.conf' do
  source 'auditd.conf.erb'
  notifies :restart, 'service[auditd]', :immediately
end

service 'auditd' do
  action :nothing
end

# Fix sysctl-* findings in CIS/DevSec baseline
template '/etc/sysctl.conf' do
  source 'sysctl.conf.erb'
  notifies :run, 'execute[Reload sysctl]', :immediately
end

execute 'Reload sysctl' do
  command 'sysctl --system'
  action :nothing
end
