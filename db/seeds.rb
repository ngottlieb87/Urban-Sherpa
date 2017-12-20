Tour.destroy_all

20.times do |index|
  Tour.create!(title: Faker::Zelda.game,
                  photo: URI.parse(Faker::LoremPixel.image),
                  price: rand(10...100),
                  description: Faker::Lorem.sentence(5, false,0).chop,
                  location: Faker::Zelda.location,
                  date: Faker::Date.between(2.days.ago, Date.today))
  end

p "Created #{Tour.count} tours"
