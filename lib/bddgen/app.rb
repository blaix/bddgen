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
      init_rakefile
      
      append_file "Gemfile", "gem 'cucumber'\n"
      append_file "Rakefile", BDDGen::Tasks.cucumber
      
      add_file "features/step_definitions/#{project_name}_steps.rb"
      copy_file "features/support/env.rb"
    end
    
    desc "rspec", "Generate boilerplate for rspec"
    def rspec
      init_gemfile
      init_rakefile
      
      append_file "Gemfile", "gem 'rspec'\n"
      append_file "Rakefile", BDDGen::Tasks.rspec
      
      copy_file "spec/spec_helper.rb"
    end
    
    private
    
    def project_name
      destination_root.split(/\/|\\/).last
    end
    
    def init_gemfile
      unless File.exist?(File.join(destination_root, "Gemfile"))
        add_file "Gemfile"
        append_file "Gemfile" do
          "source 'http://rubygems.org'\n\n" +
          "gem 'rake'\n"
        end
      end
    end

    def init_rakefile
      unless File.exist?(File.join(destination_root, "Rakefile"))
        add_file "Rakefile"
        append_file "Rakefile" do
          "require 'rubygems'\n" +
          "require 'bundler'\n" +
          "require 'bundler/setup'\n\n"
        end
      end
    end
  end
end