
# https://github.com/git-lfs/git-lfs/wiki/Installation#ubuntu
cookbook_file "/opt/git/git-lfs-script.deb.sh" do
  source "git-lfs-script.deb.sh"
end

script
sudo apt-get install git-lfs
git lfs install
