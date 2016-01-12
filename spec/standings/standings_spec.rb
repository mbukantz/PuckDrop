require 'rails_helper'

describe Standing do
  it "has a valid factory" do
      expect(FactoryGirl.build(:standing)).to be_valid
    end
  it "is valid with wins, losses, and games" do
    standing = build(:standing, wins: 52, losses: 30, games: 82)
    standing.valid?
    expect(standing).to be_valid
  end

  it "is valid if wins and losses equals games" do
    standing = build(:standing, wins: 52, losses: 30, games: 82)
    standing.valid?
    expect(standing).to be_valid
  end
end
