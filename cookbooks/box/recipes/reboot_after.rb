
reboot 'after' do
  only_if { ::File.exist?('/var/run/reboot-required') }
  action :request_reboot
  reason 'System needs reboot'
  delay_mins 1
end

