User.destroy_all
Tour.destroy_all

20.times do |index|
  User.create!( email: Faker::Internet.email ,
                user_name:Faker::Hacker.verb,
                admin: false,
                guide: true,
                password: "Password1"
                )
  end

20.times do |index|
  Tour.create!( title: Faker::Zelda.game,
                price: rand(10...100),
                description: Faker::Lorem.sentence(5, false,0).chop,
                location: Faker::Zelda.location,
                date: Faker::Date.between(2.days.ago, Date.today),
                user_id: rand(1...20))
  end

p "Created #{User.count} users"
p "Created #{Tour.count} tours"
