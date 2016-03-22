require 'rails_helper'

RSpec.describe CourseCategory, type: :model do
 it { is_expected.to belong_to(:course) }
end
