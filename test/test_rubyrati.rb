require File.dirname(__FILE__) + '/test_helper.rb'

class TestRubyrati < Test::Unit::TestCase

  def setup
    @key = "b6425e9df954b905715467164916a4d3"
    @url = "http://irishwonder.syndk8.co.uk"
  end
  
  def test_should_do_a_basic_cosmos_query
    testblog = Rubyrati::Blog.new(@url)
    result = testblog.get_links(@key)
    assert_not_nil(result)
    p result
  end

  def test_should_return_a_hash_of_parameters_for_a_cosmos_query
    testblog = Rubyrati::Blog.new(@url)
    assert_equal(Hash, testblog.get_links(@key).class)
  end

  def test_should_have_proper_elements_in_a_cosmos_query
    flunk "To write."
  end

end