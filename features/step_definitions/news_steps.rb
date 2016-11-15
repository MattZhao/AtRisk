Given /the following faq questions exist/ do |table|
  table.hashes.each do |news_params|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    news = News.create news_params
    news.save!
  end
end