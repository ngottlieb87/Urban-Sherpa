FactoryBot.define do

  factory(:user) do
    user_name('gregor')
    email('g@g.com')
    password('Password1')
    guide(true)
    avatar{ fixture_file_upload(Rails.root.join('spec', 'images', 'ghost.png'), 'image/png') }
  end
end
