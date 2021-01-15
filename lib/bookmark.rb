require 'pg'

class Bookmark
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end

    bookmarks = connection.exec('SELECT * FROM bookmarks')
    bookmarks.map { |bookmark| bookmark['url'] }
  end
end

# before adding ENV

# require 'pg'

# class Bookmark
#  def self.all
#    connection = PG.connect(dbname: 'bookmark_manager')
#    result = connection.exec('SELECT * FROM bookmarks;')
#    result.map { |bookmark| bookmark['url'] }
#  end
# end
