require 'rubyrati'

module Rubyrati
  class Blog < Base
    def get_links(key, *args)
      path = "cosmos"
      res = fetch(path, key, *args)
      parsed_response = {:linking_blogs => res.search("//item").collect{|i| resultify_links(i)}}
    end
    
    private
    
    def resultify_links(element)
      {
        :name => element.search("//weblog/name").inner_html,
        :url => element.search("//weblog/url").inner_html,
        :rssurl => element.search("//weblog/rssurl").inner_html,
        :atomurl => element.search("//weblog/atomurl").inner_html,
        :inbound_blogs => element.search("//weblog/inboundblogs").inner_html,
        :inbound_links => element.search("//weblog/inboundlinks").inner_html,
        :last_update => element.search("//weblog/lastupdate").inner_html,
        :nearest_permalink => element.search("//nearestpermalink").inner_html,
        :excerpt => element.search("//excerpt").inner_html,
        :link_created => element.search("//linkcreated").inner_html,
        :link_url => element.search("//linkurl").inner_html
      }
    end
    
    def resultify_blog(elements)
      {
        # To be written.
      }
    end
  end
end