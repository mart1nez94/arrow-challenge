require 'rails_helper'

RSpec.describe Arrow, type: :model do
  before :all do
    create_user(1, 'user@email.com', 'User', 'user123').save
    create_user(2, 'another_user@email.com', 'Another User', 'user123').save
  end

  subject { Arrow.new(reason: "Test", user_id: 1, from_user_id: 2) }

  context "Validations" do
    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without a reason" do
      subject.reason = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without an user_id" do
      subject.user_id = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without a from_user_id" do
      subject.from_user_id = nil
      expect(subject).to_not be_valid
    end
  end

  context "Associations" do
    it "it's associated with the user model" do 
      should belong_to(:user)
    end
  end

  def create_user(id, email, name, password)
    User.new(id: id, email: email, name: name, password: password)
  end
end
