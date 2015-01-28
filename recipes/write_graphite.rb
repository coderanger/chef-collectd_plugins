#
# Cookbook Name:: collectd_plugins
# Recipe:: write_graphite
#
# Copyright 2015, Evgeny Vereshchagin
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

include_recipe "collectd"

collectd_plugin 'write_graphite' do
  options(
    'Host' => node['collectd_plugins']['write_graphite']['host'],
    'Port' => node['collectd_plugins']['write_graphite']['port'],
    'EscapeCharacter' => '_',
    'SeparateInstances' => true,
    'StoreRates' => false,
    'AlwaysAppendDS' => false,
  )
  cookbook 'collectd_plugins'
  template 'write_graphite.conf.rb'
end
