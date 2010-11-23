require 'thor'

module BDDGen
  class App < Thor
    include Thor::Actions
    
    def self.source_root
      File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'templates'))
    end
    
    desc "cucumber", "Generate boilerplate for cucumber"
    def cucumber
      init_gemfile
      append_gem 'cucumber'

      init_rakefile
      append_task BDDGen::Tasks.cucumber
      
      add_file "features/step_definitions/#{project_name}_steps.rb"
      copy_file "features/support/env.rb"
      template "features/support/helpers.erb", "features/support/helpers.rb"
    end
    
    desc "rspec", "Generate boilerplate for rspec"
    def rspec
      init_gemfile
      append_gem 'rspec'

      init_rakefile
      append_task BDDGen::Tasks.rspec
      
      copy_file "spec/spec_helper.rb"
    end
    
    desc "yard", "Generate boilerplate for yard"
    def yard
      init_gemfile
      append_gem 'yard'
      
      init_rakefile
      append_task BDDGen::Tasks.yard(project_name)

      init_gitignore
      append_file ".gitignore", "doc/*\n"
      append_file ".gitignore", ".yardoc\n"
    end
    
    desc "project name", "Generate a new ruby project named [name]"
    method_options :cucumber => :boolean, :rspec => :boolean, :yard => :boolean
    def project(name)
      empty_directory name
      self.destination_root = name

      empty_directory "lib/#{name}"
      
      init_gitignore
      init_gemfile
      init_rakefile
      
      add_file "CHANGELOG"
      add_file "README.markdown"
      
      template "lib/project.erb", "lib/#{name}.rb"
      
      cucumber if options.cucumber?
      rspec    if options.rspec?
      yard     if options.yard?
    end
    
    private
    
    def project_name
      destination_root.split(/\/|\\/).last
    end
    
    def init_gemfile
      unless destination_file_exists?("Gemfile")
        add_file "Gemfile"
        append_file "Gemfile" do
          "source 'http://rubygems.org'\n\n" +
          "gem 'rake'\n"
        end
      end
    end

    def init_rakefile
      unless destination_file_exists?("Rakefile")
        add_file "Rakefile"
        append_file "Rakefile" do
          "require 'rubygems'\n" +
          "require 'bundler'\n" +
          "require 'bundler/setup'\n\n"
        end
      end
    end
    
    def init_gitignore
      add_file ".gitignore" unless destination_file_exists?(".gitignore")
      ensure_eof_newline(".gitignore")
    end
    
    def destination_file_exists?(filename)
      File.exist?(File.join(destination_root, filename))
    end
    
    def append_gem(gem_name)
      ensure_eof_newline("Gemfile")
      append_file "Gemfile", "gem '#{gem_name}'\n"
    end
    
    def append_task(the_task)
      append_file "Rakefile", "\n\n#{the_task}\n"
    end
    
    def ensure_eof_newline(filename)
      gsub_file(filename, /([^\n])\z/, "\\1\n")
    end
  end
end