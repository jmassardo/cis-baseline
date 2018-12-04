#
# Cookbook:: cis_baseline
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

case node['platform']
when 'windows'
  include_recipe 'cis_baseline::windows'
when 'ubuntu'
  include_recipe 'cis_baseline::ubuntu'
end
