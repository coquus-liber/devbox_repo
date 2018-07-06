
reboot 'now' do
  only_if { ::File.exist?('/var/run/reboot-required') }
  action :reboot_now
  reason 'System needs reboot'
  delay_mins 1
end

