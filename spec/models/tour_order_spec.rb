require 'rails_helper'

describe TourOrder do
  it { should belong_to :tour }
  it { should belong_to :order }
end
