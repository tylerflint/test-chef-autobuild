# 0- Validate
supported_platforms = ['centos']
if not supported_platforms.include? node[:platform]
  Chef::Log.info("#{node[:platform]} is not yet supported :(")
  exit(1)
end

# 1- Prep any temp or staging directories
include_recipe "#{node[:platform]}::prepare"

# 2- Install dependencies/libraries into machine
include_recipe "#{node[:platform]}::installer"

# 3- Build & package the project
include_recipe "#{node[:platform]}::builder"

# 4- Upload the build package
include_recipe "#{node[:platform]}::uploader"

# 5 - Cleanup
include_recipe "#{node[:platform]}::cleanup"
