module BDDGen
  class Tasks
    def self.cucumber
      @cucumber_tasks ||= read_task_file('cucumber.rb')
    end

    def self.rspec
      @rspec_tasks ||= read_task_file('rspec.rb')
    end
    
    private
    def self.read_task_file(filename)
      File.read(File.join(BDDGen::App.source_root, 'rake_tasks', filename))
    end
  end
end