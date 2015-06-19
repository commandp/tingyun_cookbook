#
# Cookbook Name:: tingyun
# Recipe:: default
#
# Copyright 2015, Commandp Inc.
#
# All rights reserved - Do Not Redistribute
#

source_url = "#{node['tingyun']['source']}#{node['tingyun']['version']}/"

case node['platform_family']
when 'debian'
  if node['kernel']['machine'] == 'x86_64'
    filename   = "tingyun-agent-system-#{node['tingyun']['version']}.x86_64.deb"
    agent_file = "#{source_url}#{filename}"
  else
    filename   = "tingyun-agent-system-#{node['tingyun']['version']}.i386.deb"
    agent_file = "#{source_url}#{filename}"
  end
when 'rhel'
  if node['kernel']['machine'] == 'x86_64'
    filename   = "tingyun-agent-system-#{node['tingyun']['version']}.x86_64.rpm"
    agent_file = "#{source_url}#{filename}"
  else
    filename   = "tingyun-agent-system-#{node['tingyun']['version']}.i386.rpm"
    agent_file = "#{source_url}#{filename}"
  end
end

remote_file "#{Chef::Config[:file_cache_path]}/#{filename}" do
  owner 'root'
  group 'root'
  mode '0644'
  source agent_file
end

case node['platform_family']
when 'debian'
  execute 'execute TingYun installation' do
    command "sudo dpkg -i #{Chef::Config[:file_cache_path]}/#{filename}"
    action :run
  end
when 'rhel'
  execute 'execute TingYun installation' do
    command "sudo rpm -Uvh #{Chef::Config[:file_cache_path]}/#{filename}"
    action :run
  end
end

execute 'execute TingYun installation' do
  command "/usr/local/bin/nbsys-config nbs.license_key=#{node['tingyun']['license_key']}"
  action :run
end

service 'tingyun' do
  provider Chef::Provider::Service::Upstart if platform?('ubuntu')
  supports status:  true,
           restart: true,
           start: true,
           stop: true
  start_command   '/etc/init.d/nbsysd start'
  status_command  '/etc/init.d/nbsysd status'
  restart_command '/etc/init.d/nbsysd restart'
  stop_command    '/etc/init.d/nbsysd stop'
  action [:restart]
end
