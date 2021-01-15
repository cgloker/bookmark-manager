# frozen_string_literal: true

require 'sinatra/base'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  get '/' do
    'Bookmark Manager'
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb :'bookmark'
  end

  get '/bookmarks/new' do
    erb :'bookmarks/new'
  end

# Get the url from the submitted form data (params).
# Connect to the test database.
# Execute the SQL to insert a new bookmark to the database, with a url value of the url submitted by the user.
# Redirect to the homepage (which shows all bookmarks, thanks to the get '/bookmarks' route defined in app.rb).

  post '/bookmarks' do
    url = params['url']
    connection = PG.connect(dbname: 'bookmark_manager_test')
    connection.exec("INSERT INTO bookmarks (url) VALUES('#{url}')")
    redirect '/bookmarks'
  end

  run! if app_file == $0
end
