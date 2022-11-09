require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Validations" do
    it "should validate if the password and Password_confirmation match" do
      @user = User.new
      @user.password = "jungle"
      @user.password_confirmation = "jungle"
      expect(@user.password).to eql(@user.password_confirmation)
    end

    it "should validate if the email is unique" do
      @user = User.new
      @userTwo = User.new
      @user.email = "testing123@gmail.com"
      @userTwo.email = "Testing123@gmail.com"
      @user.firstname = "Zac"
      @user.lastname = "Jefrey"
      @userTwo.firstname = "Zac"
      @userTwo.lastname = "Jefrey"
      @user.password = "jungle"
      @user.password_confirmation = "jungle"
      @userTwo.password = "jungle"
      @userTwo.password_confirmation = "jungle"
      @user.save
      @userTwo.save
      expect(@userTwo.errors.full_messages.include?("Email has already been taken")).to eql(true)
    end
      

    it "shoud validate if first name and last name exist" do
      @user = User.new
      @user.firstname = "Zac"
      @user.lastname = "Jefrey"
      @user.email = "testing123@gmail.com"
      @user.password = "jungle"
      @user.password_confirmation = "jungle"
      @user.save
      expect(@user.firstname).to be_present
      expect(@user.lastname).to be_present
    end

    it "should validate if the given password is 5 characters or more" do
      @user = User.new
      @user.firstname = "Zac"
      @user.lastname = "Jefrey"
      @user.email = "testing123@gmail.com"
      @user.password = "jungle"
      @user.password_confirmation = "jungle"
      @user.save
      expect(@user.valid?).to eql(true)
    end
    
    it "should validate if the given password is shorter than 5 character" do
      @user = User.new
      @user.firstname = "Zac"
      @user.lastname = "Jefrey"
      @user.email = "testing123@gmail.com"
      @user.password = "jun"
      @user.password_confirmation = "jun"
      @user.save
      expect(@user.errors.full_messages.include?("Password is too short (minimum is 5 characters)")).to eql(true)
    end

    describe '.authenticate_with_credentials' do
      it "should find the correct user with email and password" do
      @user = User.new
      @user.firstname = "Zac"
      @user.lastname = "Jefrey"
      @user.email = "testing123@gmail.com"
      @user.password = "jungle"
      @user.password_confirmation = "jungle"
      @user.save
      @userTwo = User.authenticate_with_credentials(@user.email, @user.password)
      expect(@user.id).to eql(@userTwo.id)
      end
    end


    


      
  end
end