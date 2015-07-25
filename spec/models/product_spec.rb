# == Schema Information
#
# Table name: products
#
#  id         :integer          not null, primary key
#  name       :string
#  sku        :string
#  category   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require "spec_helper"

describe Product do
  it "should have a factory" do
    expect(FactoryGirl.build(:product)).to be_valid
  end

  context "validations" do
    it { should validate_uniqueness_of(:sku) }
    it { should validate_presence_of(:sku) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:category) }
  end
end