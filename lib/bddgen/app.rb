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
    
    def append_gem(gem_name)
      gsub_file("Gemfile", /([^\n])\z/, "\\1\n") # ensure newline at eof
      append_file "Gemfile", "gem '#{gem_name}'\n"
    end
    
    def append_task(the_task)
      append_file "Rakefile", "\n\n#{the_task}\n"
    end
  end
end