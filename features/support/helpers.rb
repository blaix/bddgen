module BDDGen
  module CucumberHelpers
    def tmp_dir
      File.expand_path("../../tmp/aruba", File.dirname(__FILE__))
    end
    
    def template_dir
      BDDGen::App.source_root
    end
    
    def read_temp_file(file)
      if @working_dir
        File.read(File.join(tmp_dir, @working_dir, file))
      else
        File.read(File.join(tmp_dir, file))
      end
    end
  end
end

World(BDDGen::CucumberHelpers)