module Webistrano
  module Template
    module SearchmetricsGit
      CONFIG = {
        :application => 'your_app_name',
        :scm => 'git',
        :deploy_to => '/var/www/deploy',
        :deploy_via => ':copy',
        :scm_username => 'git_deployer',
        :user => 'deployment',
        :ssh_keys => '/var/www/webistrano/.ssh/id_rsa',
        :use_sudo => 'false',
        :gitlab_namespace => 'searchmetrics',
        :gitlab_repository => 'your_app_repo',
        :repository => 'ignore_me',
        :copy_exclude => '[".svn", "**/.svn", ".git", ".DS_Store", "*.sample", "LICENSE*", "Capfile", "RELEASE*", "nbproject", "_template", "pkginfo"]',
        :copy_cache => true,
        :copy_compression => ":bz2",
        :keep_releases => 10,
      }.freeze
      
      DESC = <<-'EOS'
        The searchmetrics git deploy template, for use with projects hosted on gitlab.
        <br><br>
        To use, set the gitlab_namespace and gitlab_repository configuration values. Furthermore, each
        stage should have a 'branch' configuration that points to the tag to be deployed (e.g. 'v0.4').
      EOS
      
      TASKS = Webistrano::Template::Base::TASKS + <<-'EOS'
      
        if exists?(:gitlab_namespace) && exists?(:gitlab_repository)
          set :repository, "git@git.seometrie.dev:#{gitlab_namespace}/#{gitlab_repository}.git"
        end
      
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
