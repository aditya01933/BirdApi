require 'rails_helper'

RSpec.describe Bird, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:family) }
  it { is_expected.to validate_presence_of(:continents) }
  it "should validate default value of added to be Date today" do
    bird = FactoryGirl.build(:bird)
    expect(bird.added).to eq(Date.today)
  end
  it "should validate default value of visible to be false" do
    bird = FactoryGirl.build(:bird, visible: '')
    expect(bird.visible).to be(false)
  end
end
