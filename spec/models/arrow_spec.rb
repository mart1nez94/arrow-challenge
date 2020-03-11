require 'rails_helper'

RSpec.describe Arrow, type: :model do

  it "is valid with valid attributes" do
    create_user.save
    create_another_user.save
    
    expect(Arrow.new(comment: "1 arrow", user_id: 2, to_user_id: 1)).to be_valid
  end

  it "should return an array with the user arrows got" do
    user = create_user
    user.save
    create_another_user.save

    3.times do |time|
      arrow = Arrow.new(comment: "#{time} arrow", user_id: 2, to_user_id: 1)
      arrow.save
    end

    arrows = Arrow.by_user(user.id)

    expect(arrows.size).to eql 3
  end

  def create_user
    User.new( id: 1, 
              email: "prueba@gmail.com",
              name: "Prueba", 
              password: "prueba")
  end

  def create_another_user
    User.new( id: 2, 
              email: "prueba2@gmail.com",
              name: "Prueba 2", 
              password: "prueba2")
  end
end
