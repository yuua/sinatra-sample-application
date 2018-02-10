require 'sinatra'
require 'sinatra/activerecord'
require './models/topics'

get '/topics' do
  content_type :json, :charset => 'utf-8'
  topics = Topic.order("created_at DESC").limit(10)
  topics.to_json(:root => false)
end

get '/topic/:id' do
  content_type :json, :charset => 'utf-8'
  topic = Topic.find_by_id(params['id'])
  topic.to_json(:root => false)
end

post '/topic' do
  req = JSON.parse(request.body.read.to_s) 
  title = req['title']
  description = req['description']

  topic = Topic.new
  topic.title = title
  topic.description = description
  topic.save

  status 202  
end

put '/topic/:id' do
  req = JSON.parse(request.body.read.to_s) 
  title = req['title']
  description = req['description']
  
  topic = Topic.find(params['id'])
  title != nil ? topic.update(title: title) : ''
  description != nil ? topic.update(description: description) : ''

  status 204
end

delete '/topic/:id' do
  topic = Topic.find(params['id'])
  topic.destroy

  status 204
end
