require 'rails_helper'

describe Order do
  it { should belong_to :account }
  it { should have_many :tour_orders }
  it { should have_many :tours }
end
