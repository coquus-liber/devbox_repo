
directory '/opt/git'

remote_file '/opt/git/git-prompt.sh' do
  source node[:box][:git_prompt][:src]
  mode "0755"
end

cookbook_file '/etc/profile.d/git_prompt_config.sh' do
  source 'git_prompt_config.sh'
  mode "0755"
end

