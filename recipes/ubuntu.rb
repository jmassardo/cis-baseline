#
# Author:: James Massardo (<james@dxrf.com>)
# Copyright:: Copyright (c) James Massardo
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

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
