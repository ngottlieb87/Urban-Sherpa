FactoryBot.define do

  factory(:user) do
    user_name('gregor')
    email('g@g.com')
    password('Password1')
    guide(true)
    avatar{ fixture_file_upload(Rails.root.join('spec', 'images', 'ghost.png'), 'image/png') }
  end

  factory(:attendee, class: User) do
    user_name('lil')
    email('h@h.com')
    password('Password2')
    guide(false)
    avatar{ fixture_file_upload(Rails.root.join('spec', 'images', 'ghost.png'), 'image/png') }
  end

  factory(:tour) do
    title("Day Hike")
    description("Hike during the day")
    location("Portland, Or")
    time("11:00")
    date("2019-01-01")
    price("40.00")
    user_id(1)
    photo {fixture_file_upload(Rails.root.join('spec', 'images', 'city.jpeg'), 'image/jpeg') }
  end

  factory(:tour2, class: Tour) do
    title("Night Hike")
    description("Hike during the night")
    location("San Francisco, Ca")
    time("22:00")
    date("2019-05-13")
    price("60.00")
    user_id(1)
    photo {fixture_file_upload(Rails.root.join('spec', 'images', 'city.jpeg'), 'image/jpeg') }
  end

  factory(:tour3, class: Tour) do
    title("Distillery Tour")
    description("Distillery Tour with tasting")
    location("Seattle, Wa")
    time("11:00")
    date("2019-01-01")
    price("12.00")
    user_id(1)
    photo {fixture_file_upload(Rails.root.join('spec', 'images', 'city.jpeg'), 'image/jpeg') }
  end

  factory(:comment) do
    body("Test Comment")
    user_id(1)
    tour_id(1)
  end

  factory(:comment2, class:Comment) do
    body("Test Comment 2")
    user_id(2)
    tour_id(1)
  end

  factory(:account) do
    user_id(1)
  end

  factory(:account2, class: Account) do
    user_id(2)
  end
end
