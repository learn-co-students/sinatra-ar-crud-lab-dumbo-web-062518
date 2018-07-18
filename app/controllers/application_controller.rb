
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do

  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    Post.create(posts_params)
    erb :index
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :show
  end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :edit
  end

  patch '/posts/:id' do
    @post = Post.find(params[:id])
    @post.update(posts_params)

    erb :show
  end

  get '/posts/:id/delete' do
    @post = Post.find(params[:id])

    erb :delete
  end

  delete '/posts/:id/delete' do
    Post.destroy(params[:id])
    @post = Post.find(params[:id])

    erb :delete
  end

  private
  def posts_params
    params["posts"]
  end
end
