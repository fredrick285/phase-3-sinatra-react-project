class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get '/' do
    tasks=Task.all
    tasks.to_json
  end

  post '/tasks' do
    tasks=Task.create(body:params[:body],username:params[:username])
    tasks.to_json
  end

  patch '/tasks/:id' do
    tasks=Task.find(params[:id])
    tasks.update(
      body: params[:body]
    )
    tasks.to_json
  end

  delete '/tasks/:id' do
    tasks=tasks.find(params[:id])
    tasks.destroy
    tasks.to_json
  end

end