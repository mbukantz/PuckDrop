require 'rails_helper'


  describe Player do
    it "has a valid factory" do
      expect(FactoryGirl.build(:player)).to be_valid
    end

  it "is valid with a first_name,last_name, and birthday" do
    player = create(:player)
    player.valid?
    expect(player).to be_valid
  end

  it "is invalid without a first_name" do
    player = build(:player,first_name: nil)
    player.valid?
    expect(player.errors[:first_name]).to include("can't be blank")
  end

  it "is invalid without a first_name" do
    player = build(:player,last_name: nil)
    player.valid?
    expect(player.errors[:last_name]).to include("can't be blank")
  end

  it "is invalid without a first_name" do
    player = build(:player,birthday: nil)
    player.valid?
    expect(player.errors[:birthday]).to include("can't be blank")
  end

  it "returns a contact's full name as a string" do
    player = build(:player)
    expect(player.full_name).to eq "Michael Bukantz"
  end

  it "returns the correctly formatted birthday" do
    player = build(:player)
    expect(player.birthdate).to eq "May 18, 1988"
  end
end
