require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    # validation examples here
    it "should not be true" do
      @user = User.new(name:'bob',email:'bob@bob.com',password:'123',password_confirmation:'1')
    
      expect(@user.save).to be(false)
    end

    it "should not be valid" do
      @user = User.new(name:'bob',email:'bob@bob.com',password:'123',password_confirmation:'123')
    
      expect(@user.save).to be(true)
    end

    it "should not be valid" do
      @firstuser =  User.create(name:'bob',email:'bob@bob.com',password:'123',password_confirmation:'123')
      @user = User.create(name:'bob2',email:'BOB@BOB.COM',password:'456',password_confirmation:'456')
      expect(@user).to_not be_valid 
    end
  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
  end
end
