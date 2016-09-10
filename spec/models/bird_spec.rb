require 'rails_helper'

RSpec.describe Bird, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:family) }
  it { is_expected.to validate_presence_of(:continents) }
end
