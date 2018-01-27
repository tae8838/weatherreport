require 'rails_helper'

RSpec.describe WeatherStation, type: :model do
  it { should have_many(:readings) }
end
