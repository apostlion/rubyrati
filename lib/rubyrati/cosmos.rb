require 'rubyrati'

module Rubyrati
  class Blog < Base
    def get_links(key, args)
      path = "cosmos"
      fetch(path, key, args)
    end
  end
end