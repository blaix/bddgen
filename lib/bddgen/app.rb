require 'thor'

module BDDGen
  class App < Thor
    include Thor::Actions
    
    def self.source_root
      File.expand_path(File.join(File.dirname(__FILE__), '..', '..', 'templates'))
    end
    
    desc "cucumber", "Generate boilerplate for cucumber"
    def cucumber
      copy_file "features/support/env.rb", "features/support/env.rb"
      add_file "features/step_definitions/#{project_name}_steps.rb"
      copy_file "Gemfile", "Gemfile"
      template "Rakefile.erb", "Rakefile"
    end
    
    private
    def project_name
      destination_root.split(/\/|\\/).last
    end
  end
end