require 'rubyrati'
require 'net/http'
require 'cgi'
require 'rexml/document'
require 'rexml/xpath'

module Rubyrati
  class Base
    def initialize(args)
    end
    
    def fetch(path, key, args)
      url = URI.parse("http://api.technorati.com/" + path)
      @complete_url = url.path + self.key(key) + self.set_arguments(args)
      response = Net::HTTP.start(uri.host, uri.port) do |http|
        http.get @complete_url, 'User-Agent' => key, 'Accept' => 'text/xml'
      end
      result = REXML::Document.new( response.body.to_s, {:raw => "all"})
      result
    end
    
  private
    
    def self.key(key)
      "?key=#{CGI::escape key}"
    end
    
    def self.set_arguments(args)
      arguments = ""
      args.each do |key, value|
        arguments << "&#{key.to_s}=#{CGI::escape value.to_s}"
      end
    end
    
  end
  
  class Blog < Base
    def initialize(url)
      @url = url
    end
  end
  
  class Query < Base
    
  end
end