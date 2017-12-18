require 'rails_helper'

describe Tour do
  it { should have_many :orders}
  it { should have_many :tour_orders}
  it { should validate_presence_of :price }
  it { should validate_presence_of :title }
  it { should validate_presence_of :description }
  it { should validate_presence_of :location }
end
