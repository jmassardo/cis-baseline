#
# Cookbook:: cis_baseline
# Recipe:: default
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
