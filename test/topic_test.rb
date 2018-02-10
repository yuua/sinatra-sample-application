require File.expand_path '../test_helper.rb', __FILE__

class AppTest < ActiveSupport::TestCase
  def setup
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.start
    post '/topic', '{"title":"foo","description":"bar"}', 'CONTENT_TYPE' => 'application/json'
  end

  def test_get_topics
    get '/topics'
    assert last_response.ok?
    assert_equal 200, last_response.status
  end

  def test_get_topic_1
    get '/topic/1'
    assert last_response.ok?
    assert_equal 200, last_response.status
  end

  def test_post_topic
    post '/topic', '{"title":"foo","description":"bar"}', 'CONTENT_TYPE' => 'application/json'
    assert_equal 202, last_response.status
  end

  def test_put_topic_1
    put '/topic/1', '{"title":"baz","description":""}', 'CONTENT_TYPE' => 'application/json'
    assert_equal 204, last_response.status
  end

  def test_delete_topic_1
    delete '/topic/1', '', 'CONTENT_TYPE' => 'application/json'
    assert_equal 204, last_response.status
  end

end
