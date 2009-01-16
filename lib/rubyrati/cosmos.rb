require 'rubyrati'

module Rubyrati
  class Blog < Base
    def get_links(key, *args)
      path = "cosmos"
      fetch(path, key, *args)
    end
    
    private
    
    def resultify(element)
      {
        :name => element.search("//weblog/name").inner_html,
        :url => element.search("//weblog/url").inner_html,
        :rssurl => element.search("//weblog/rssurl").inner_html,
        :atomurl => element.search("//weblog/atomurl").inner_html,
        :inbound_blogs => element.search("//weblog/inbound_blogs").inner_html,
        :inbound_links => element.search("//weblog/inbound_links").inner_html,
        :last_update => element.search("//weblog/last_update").inner_html,
        :nearest_permalink => element.search("//nearestpermalink").inner_html,
        :excerpt => element.search("//excerpt").inner_html,
        :link_created => element.search("//linkcreated").inner_html,
        :link_url => element.search("//linkurl").inner_html,
      }
    end
  end
end