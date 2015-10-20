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
  action [:stop]
  only_if { ::File.exists?('/etc/init.d/nbsysd') }
end

case node['platform_family']
when 'debian'
  execute 'Remove TingYun' do
    command "sudo dpkg -r tingyun-agent-system"
    action :run
    only_if "which tingyun-agent-system"
  end
when 'rhel'
  execute 'execute TingYun installation' do
    command "sudo rpm -e tingyun-agent-system"
    action :run
    only_if "which tingyun-agent-system"
  end
end
