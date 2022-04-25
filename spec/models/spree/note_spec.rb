require 'spec_helper'

RSpec.describe Spree::Note, :type => :model do
  it "is not valid without a note" do
    note = Spree::Note.new(note: nil)
    expect(note).to_not be_valid
  end

  it "is not valid without a user" do
    note = Spree::Note.new(user_id: nil)
    expect(note).to_not be_valid
  end

  describe "Associations" do
   it { should belong_to(:user).without_validating_presence }
   it { should belong_to(:notable).without_validating_presence }
  end
end
