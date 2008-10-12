require File.dirname(__FILE__) + '/test_helper.rb'

class TestRubyrati < Test::Unit::TestCase

  def setup
    @key = "b6425e9df954b905715467164916a4d3"
    @url = "http://irishwonder.syndk8.co.uk"
  end
  
  def test_should_do_a_basic_cosmos_query
    testblog = Rubyrati::Blog.new(@url)
    assert_not_nil(testblog.get_links(@key))
  end

end