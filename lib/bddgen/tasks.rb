module BDDGen
  class Tasks
    def self.cucumber
      @cucumber_tasks ||= File.read(
        File.join(BDDGen::App.source_root, 'rake_tasks', 'cucumber.rb')
      )
    end
  end
end