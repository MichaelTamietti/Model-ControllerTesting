require 'rails_helper'

RSpec.describe Student, type: :model do
  # write your student model here

  it 'greets humans if friendly' do
    expect(FactoryBot.create(:robot).greet).to eq('Hello') 
   end
    
   it 'attacks humans if not friendly' do
      robot = FactoryBot.create(:robot, friendly: false)
      expect(robot.attack).to eq(true)
   end
end 