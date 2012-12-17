# 2- Install dependencies/libraries into machine

package "build-essential" do
  action :install
end

include_recipe "ruby"

gempackage "fpm" do
  action :install
end


