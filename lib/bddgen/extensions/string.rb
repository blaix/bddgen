module BDDGen
  module Extensions
    module String
      # This is a really simple stupid method that can't handle much besides
      # strings that have spaces, dashes, or underscores.
      def camelize
        self.capitalize.gsub(/[ _\-]+([a-z])?/) { $1.upcase }
      end
    end
  end
end

String.send(:include, BDDGen::Extensions::String)