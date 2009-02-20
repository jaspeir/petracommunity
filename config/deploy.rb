set :application, "petra2008"
set :repository,  "http://#{application}.googlecode.com/svn/trunk/"

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
set :deploy_to, "/var/www/#{application}"

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
# set :scm, :subversion

role :app, "root@88.84.142.91"    #"root@83.246.72.38"
role :web, "root@88.84.142.91"     #"root@83.246.72.38"
role :db,  "root@88.84.142.91", :primary => true
