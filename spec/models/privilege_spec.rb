require "rails_helper"

RSpec.describe Privilege, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:challenge) }

    it { should belong_to(:user) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
