require 'rails_helper'

RSpec.describe Survey, type: :model do
  it 'has a valid factory' do
    expect(create(:survey)).to be_valid
  end
end
