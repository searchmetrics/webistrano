module Webistrano
  module Template
    module Searchmetrics 
      CONFIG = {
        :application => 'your_app_name',
        :scm => 'subversion',
        :deploy_via => ':copy',
        :scm_username => 'iserver',
        :scm_password => 'iserver1010',
        :user => 'develop',
        :ssh_keys => '/var/www/deployment.local/.ssh/id_rsa',
        :use_sudo => 'false',
        :repository => 'do not edit or delete this property. will be set later.',
        :repository_base => 'http://svn.seometrie.dev/svn',
        :copy_exclude => [".svn", "**/.svn", ".git", ".DS_Store", "*.sample", "LICENSE*", "Capfile", "RELEASE*", "*.rb", "*.sql", "nbproject", "_template", "pkginfo"],
        :copy_cache => true,
        :copy_compression => :bz2,
        :keep_releases => 10,
      }.freeze
      
      DESC = <<-'EOS'
        The searchmetrics deploy template.
      EOS
      
      TASKS = Webistrano::Template::Base::TASKS + <<-'EOS'
      
         namespace :deploy do
           task :restart, :roles => :app, :except => { :no_release => true } do
             # do nothing
           end

           task :start, :roles => :app, :except => { :no_release => true } do
             # do nothing
           end

           task :stop, :roles => :app, :except => { :no_release => true } do
             # do nothing
           end
         end

      EOS
	
    end
  end
end
