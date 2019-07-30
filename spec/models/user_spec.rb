require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:email)}
    it {should validate_uniqueness_of(:email)}
    it {should validate_presence_of(:password)}
  end

  describe 'attributes' do
    it 'has attributes' do
      user_1 = create(:user, email: 'email-1', token: '33ff')

      expect(user_1.email).to eq('email-1')
      expect(user_1.token).to eq('33ff')
    end

    it 'has different attributes' do
      user_1 = create(:user, email: 'email-2', token: '34fg')

      expect(user_1.email).to eq('email-2')
      expect(user_1.token).to eq('34fg')
    end
  end
end
