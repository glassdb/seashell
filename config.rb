#
# SeaShell
#
# Capistrano deployment recipes for seaside platforms
#
# Author: Andreas Brodbeck, mindclue gmbh, www.mindclue.ch
# Licence: MIT (see LICENSE file)
#                                          

###################################################################################################
# Project configuration (Change for your needs)
#

# Name of the application (No whitespace, no special characters!)
set :application, 'myapp'

# Domains of the deployed application (Example: www.myhost.com)
set :domains, ['myapp.org', 'myapp.com', 'myapp.yourdomain.net']

# Hostname of your server. Your deployed application runs there.
set :host, 'server7'

# User and group which is used for logging into the server
set :user, 'glass'
set :user_group, 'adm'

# Some pathes on the server
set :path_base, '/opt/gemstone'
set :path_gemstone, "#{path_base}/product"
set :path_seaside, "#{path_gemstone}/seaside"
set :path_lighty_application_configs, '/etc/lighttpd/seaside_applications'

# User and password for logging into Gemstone
set :gemstone_user, 'DataCurator'
set :gemstone_password do
  ask_password("Password for Gemstone user '#{gemstone_user}': ", 'swordfish')
end

# Monticello repository of your project's code
set :monticello_repository_url, 'http://monticello.somedomain.org/myapp'
set :monticello_package_name, 'MPMyApp'
set :monticello_repository_user, 'squeak'
set :monticello_repository_password do
  ask_password("Password for Monticello user '#{monticello_repository_user}': ", 'fh3ss8f382nf')
end

# Configuration of gems, running one application instance each.
# (Don't forget to renew the web server configuration, if you change this!)
set :gems_start_port, 10001
set :gems_count, 3

# Configure your seaside entry points here, as a hash with {YourRootComponent => 'entry-point-name', ...}.
# Your application will be reachable at /seaside/entry-point-name
set :entry_points, {'MPApplicationComponent' => 'mywonderfulapp'}
