module BDDGen
  class Tasks
    def self.cucumber
      @cucumber_tasks ||= read_task_file('cucumber.rb')
    end

    def self.rspec
      @rspec_tasks ||= read_task_file('rspec.rb')
    end
    
    def self.yard(project_name)
      @yard_tasks ||= read_task_file('yard.rb').gsub(
        '{{project_name}}', project_name
      )
    end
    
    private
    def self.read_task_file(filename)
      File.read(File.join(BDDGen::App.source_root, 'rake_tasks', filename))
    end
  end
end