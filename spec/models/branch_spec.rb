require_relative '../rails_helper'

RSpec.describe Branch, type: :model do
  branch_one = Branch.create(city: 'Haiti')
  Room.create(branch: branch_one, name: 'Room One', guest: 2, beds: 1, description: 'This is a room.',
              photo: 'https://www.ikea.com/mx/en/images/products/malm-be102127_pe866548_s5.jpg',
              cost: 100, reserved: false)

  it 'is valid with valid attributes' do
    expect(branch_one).to be_valid
  end

  it 'is not valid without a city' do
    branch_one.city = nil
    expect(branch_one).to_not be_valid
  end

  it 'has many rooms' do
    expect(branch_one).to respond_to(:rooms)
  end

  it 'destroys associated rooms when destroyed' do
    expect { branch_one.destroy }.to change { Room.count }.by(-1)
  end
end
