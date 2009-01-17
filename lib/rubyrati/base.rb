require 'rubyrati'
require 'rubygems'
require 'net/http'
require 'cgi'
require 'hpricot'


module Hpricot
  class Elem
    def get_html(xpath)
      search(xpath).inner_html
    end
  end
end

class String
  def tr_time_to_datetime
    DateTime.strptime(self, "%F %H:%M:%S %Z")
  end
end

##
# This module holds every class and every method that handles Technorati API.
# It contains classes for every logical entity that exists in the realm of
# Technorati datasets - Blog, Tag, Query, etc — and the Base class that all of
# them extend to handle the query functionality.

module Rubyrati
  class Base
    def initialize(args)
    end
    
    def fetch(path, key, *args)
      url = URI.parse("http://api.technorati.com/" + path)
      @complete_url = url.path + key(key) + args.collect{|x| set_arguments(x)}.join
      response = Net::HTTP.start(url.host, url.port) do |http|
        http.get @complete_url, 'User-Agent' => key, 'Accept' => 'text/xml'
      end
      result = Hpricot.XML(response.body.to_s)
      result
    end
    
    def key(key)
      "?key=#{CGI::escape key}"
    end
    
    def set_arguments(args)
      arguments = []
      args.each do |key, value|
        arguments << "&#{key.to_s}=#{CGI::escape value.to_s}"
      end
      arguments.join
    end
    
  end
  
  class Blog < Base
    def initialize(url)
      @url = url
    end
  end
end