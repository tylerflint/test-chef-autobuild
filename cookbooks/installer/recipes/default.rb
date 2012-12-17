
# 0- Validate
supported_platforms = ['centos']
if not supported_platforms.include? node[:platform]
  Chef::Log.info("#{node[:platform]} is not yet supported :(")
  exit(1)
end

# 1- Prep any temp or staging directories
include_recipe "prepare::#{node[:platform]}"

# 2- Install dependencies/libraries into machine
include_recipe "installer::#{node[:platform]}"

# 3- Build & package the project
include_recipe "builder::#{node[:platform]}"

# 4- Upload the build package
include_recipe "uploader::#{node[:platform]}"

# 5 - Cleanup
include_recipe "cleanup::#{node[:platform]}"

