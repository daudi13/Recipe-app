require 'rails_helper'

RSpec.describe User, type: :model do
  context 'associations' do
    it { should have_many(:foods) }
    it { should have_many(:recipes) }
  end

  context 'values not empty' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
  end
end
