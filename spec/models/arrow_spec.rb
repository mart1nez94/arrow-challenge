require 'rails_helper'

RSpec.describe Arrow, type: :model do

  context 'when need show all arrows' do
    it 'should return an array with the user arrows got' do
      create_user(1, 'user@email.com', 'User', 'user123').save
      create_user(2, 'another_user@email.com', 'Another User', 'user123').save
  
      3.times do |time|
        create_arrow(time, "#{time} arrow", 2, 1).save
      end
  
      arrows = Arrow.by_user(1)
  
      expect(arrows.size).to eql 3
    end
  end

  context 'when need show an arrow' do
    it 'should return a specific arrow' do
      create_user(1, 'user@email.com', 'User', 'user123').save
      create_user(2, 'another_user@email.com', 'Another User', 'user123').save

      create_arrow(1, 'Test', 2, 1).save

      arrow = Arrow.by_id(1, 1)

      expect(arrow.name).to eql 'Another User'
      expect(arrow.reason).to eql 'Test'
    end
  end

  def create_user(id, email, name, password)
    User.new(id: id, email: email, name: name, password: password)
  end

  def create_arrow(id, reason, user_id, to_user_id)
    Arrow.new(id: id, reason: reason, user_id: user_id, to_user_id: to_user_id)
  end
end
