20.times do |index|
  Tour.create!(title: Faker::Zelda.game,
                  price: rand(10...100),
                  description: Faker::Lorem.sentence(5, false,0).chop
  end
