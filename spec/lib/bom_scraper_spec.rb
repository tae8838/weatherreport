require 'rails_helper'

describe BomScraper do
  it 'scrapes BOM website successfully' do
    VCR.use_cassette('generate_readings') { described_class.generate_readings }


    expect(WeatherStation.count).to eq 21
    expect(Reading.count).to eq 21
  end
end