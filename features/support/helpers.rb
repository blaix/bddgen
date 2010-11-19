module BDDGen
  module CucumberHelpers
    def tmp_dir
      File.expand_path("../../tmp/aruba", File.dirname(__FILE__))
    end
    
    def template_dir
      BDDGen::App.source_root
    end
  end
end

World(BDDGen::CucumberHelpers)