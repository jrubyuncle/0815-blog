namespace :dev do
  # task fake: %i[db:reset environment] do
  task :fake do
    5.times do 
      Article.create!(title: "title_#{rand(1000)}",
                      content: "content_#{rand(100)}")
    end
  end
end
