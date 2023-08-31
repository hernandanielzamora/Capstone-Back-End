require_relative "../rails_helper"

RSpec.describe Branch, type: :model do
  branch = Branch.create(city: "New York")
  room = Room.create(branch: branch, name: "Room One", guest: 2, beds: 1, description: "This is a room.", photo: "https://www.ikea.com/mx/en/images/products/malm-bedroom-furniture-set-of-4-black-brown__1102127_pe866548_s5.jpg", cost: 100, reserved: false)

  it 'is valid with valid attributes' do
    expect(branch).to be_valid
  end

  it 'is not valid without a city' do
    branch.city = nil
    expect(branch).to_not be_valid
  end

  it 'has many rooms' do
    expect(branch).to respond_to(:rooms)
  end

  it 'destroys associated rooms when destroyed' do
    expect { branch.destroy }.to change { Room.count }.by(-1)
  end
end
