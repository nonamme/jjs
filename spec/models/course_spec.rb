require 'rails_helper'

RSpec.describe Course, type: :model do
  context 'associations' do
    it { is_expected.to belong_to(:owner) }
    it { is_expected.to have_one(:course_category) }
    it { is_expected.to have_many(:subscriptions) }
    it { is_expected.to have_many(:participants) }
    it { is_expected.to have_many(:chapters) }
  end
end
