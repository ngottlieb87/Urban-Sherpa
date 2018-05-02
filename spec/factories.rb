FactoryBot.define do

  factory(:user) do
    user_name('gregor')
    email('g@g.com')
    password('Password1')
    guide(true)
  end

end
