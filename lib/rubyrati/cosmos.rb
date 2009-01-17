require 'rubyrati'

module Rubyrati
  class Blog < Base
    def get_links(key, *args)
      path = "cosmos"
      res = fetch(path, key, {:url => @url}, args)
      parsed_response = {:linking_blogs => res.search("//item").collect{|i| resultify_links(i)}
      }
    end
    
    private
    
    def resultify_links(e)
      {
        :name => e.get_html("//weblog/name"),
        :url => e.get_html("//weblog/url"),
        :rssurl => e.get_html("//weblog/rssurl"),
        :atomurl => e.get_html("//weblog/atomurl"),
        :inbound_blogs => e.get_html("//weblog/inboundblogs").to_i,
        :inbound_links => e.get_html("//weblog/inboundlinks").to_i,
        :last_update => e.get_html("//weblog/lastupdate").tr_time_to_datetime,
        :nearest_permalink => e.get_html("//nearestpermalink"),
        :excerpt => e.get_html("//excerpt"),
        :link_created => e.get_html("//linkcreated").tr_time_to_datetime,
        :link_url => e.get_html("//linkurl")
      }
    end
    
    def resultify_blog(elements)
      {}
    end
  end
end