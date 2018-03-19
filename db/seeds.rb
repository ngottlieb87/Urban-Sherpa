User.destroy_all
Account.destroy_all
Tour.destroy_all

10.times do
user=User.create!( email: Faker::Internet.email ,
                user_name:Faker::Hacker.verb,
                admin: false,
                guide: true,
                password: "Password1")
  end

10.times do
  Account.create!(
                   user_id: Faker::Number.between(User.first.id,User.last.id))
    end

10.times do
  tour = Tour.create!( title: Faker::Zelda.game,
                price: rand(10...100),
                description: Faker::Lorem.sentence(5, false,0).chop,
                location: Faker::Zelda.location,
                date: Faker::Date.between(2.days.ago, Date.today),
                time: Faker::Time.forward(23, :morning),
                user_id: rand(1...10))

  end

p "Created #{User.count} users"
p "Created #{Tour.count} tours"
p "Created #{Account.count} accounts"
