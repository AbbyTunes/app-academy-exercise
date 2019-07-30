require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  subject(:user) do
    User.create(username: "MyName", password: "123456")
  end

  describe "encryption password" do
    it "password cannot be saved in the db" do
      User.create(username: "name_1", password: "hunter_1")
      user = User.find_by(username: "name_1") 
      expect(user.password).not_to be("hunter_1")
    end
  end
  
  describe "reset token" do
    it "new token != old token" do 
      User.create(username: "name_2", password: "hunter_2")
      user = User.find_by(username: "name_2") # => returns a user instance
      old_token = user.session_token
      expect(user.reset_token!).not_to be(old_token)
    end
  end


  it { should validate_presence_of(:username) } 
  it { should validate_uniqueness_of(:username) } 
  it { should validate_length_of(:password).is_at_least(6) } 

  # describe 'session token' do
  #   it 'assigns a session token' do
  #     user = User.create(username: 'MyName', password: '123456')
  #     expect(user.session_token).not_to_be_nil
  #   end
  # end
end



  # it "encrypts the password using BCrypt" do
  #     expect(BCrypt::Password).to receive(:create)  # BCrype::Password.create(password)
  #     User.new(username: "mary_mack", password: "abcdef")
  #   end
  # end
