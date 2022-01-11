require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    # validation examples here
    context "given a user" do
      it "should not be true" do
        @user = User.new(name:'bob',email:'bob@bob.com',password:'123',password_confirmation:'1')
      
        expect(@user.save).to be(false)
      end
      it "should not be valid" do
        @user = User.new(name:'bob',email:'bob@bob.com',password:'123456',password_confirmation:'123456')
      
        expect(@user.save).to be(true)
      end
      it "should not be valid" do
        @firstuser =  User.create(name:'bob',email:'bob@bob.com',password:'123',password_confirmation:'123')
        @user = User.create(name:'bob2',email:'BOB@BOB.COM',password:'456',password_confirmation:'456')
        expect(@user).to_not be_valid 
      end
      it "should not be valid" do
        @user = User.create(name:'',email:'BOB@BOB.COM',password:'456',password_confirmation:'456')
        expect(@user).to_not be_valid
        expect(@user.errors.full_messages[0]).to eq("Name can't be blank") 
      end
    end
    context "given password" do
      it "should not be valid" do
        @user = User.create(name:'bob',email:'BOB@BOB.COM',password:'456',password_confirmation:'456')
        expect(@user).to_not be_valid
        expect(@user.errors.full_messages[0]).to eq("Password is too short (minimum is 6 characters)") 
      end
      it "should be valid" do
        @user = User.create(name:'bob',email:'BOB@BOB.COM',password:'123456',password_confirmation:'123456')
        expect(@user).to be_valid
        expect(@user.errors.full_messages[0]).to eq(nil) 
      end
    end

    
    
    
  end
  
  describe '.authenticate_with_credentials' do
    it "should be valid" do
      @user = User.create(name:'bob',email:'BOB@BOB.COM',password:'123456',password_confirmation:'123456')
      @authenticate = User.authenticate_with_credentials('BOB@BOB.COM','123456')
      expect(@user).to be_valid
      expect(@authenticate).to eq(@user) 
    end
    
    it "should authenticate successfully" do
      @firstuser =  User.create(name:'bob',email:'bob@bob.COM',password:'123456',password_confirmation:'123456')
      @authenticated_user = User.authenticate_with_credentials('BOB@BOB.COM','123456')
      expect(@authenticated_user).to eq(@firstuser)
    end

    it "should authenticate successfully" do
      @firstuser =  User.create(name:'bob',email:' bob@bob.COM',password:'123456',password_confirmation:'123456')
      @authenticated_user = User.authenticate_with_credentials(' BOB@BOB.COM ','123456')
      expect(@authenticated_user).to eq(@firstuser)
    end
  end
end
