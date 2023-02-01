require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    before(:each) do 
      @user = User.new(
      first_name: "David",
      last_name: "Fig",
      email: "idc@gmail.com",
      password: "12345678",
      password_confirmation: "12345678"
    )
    end

    it "saves a valid user" do
      expect(@user).to be_valid
    end 

    it "does not save a valid user without a password" do
      @user.password = nil
      expect(@user).to_not be_valid
    end

    it "does not save a valid user without a password confirmation" do
      @user.password_confirmation = nil
      expect(@user).to_not be_valid
    end

    it "does not save a valid user without a minimum 8 character password" do
      @user.password_confirmation = "1234567"
      expect(@user).to_not be_valid
    end

    it "does not save a valid user without a matching password and password confirmation" do
     @user.password = "12345678"
     @user.password_confirmation = "87654321"
      expect(@user).to_not be_valid
    end

    it "does not save a valid user without an email" do
      @user.email = nil
      expect(@user).to_not be_valid
    end

    it "does not save a valid user without an email" do
      @user.email = nil
      expect(@user).to_not be_valid
    end

    it "does not save a valid user with an existing email" do
      @user2 = User.new(
      first_name: "David",
      last_name: "Figgy",
      email: "IDC@gmail.com",
      password: "12345678",
      password_confirmation: "12345678"
    )
    @user.save
    @user2.save
      expect(@user2).to_not be_valid
    end

    it "does not save a valid user without an email (Case sensitive)" do
      @user.email = nil
      expect(@user).to_not be_valid
    end

    it "does not save a valid user without a first name" do
      @user.first_name = nil
      expect(@user).to_not be_valid
    end

    it "does not save a valid user without a last name" do
      @user.last_name = nil
      expect(@user).to_not be_valid
    end

    it "does not save a valid user without a password" do
      @user.password = "1234567"
      expect(@user).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    before(:each) do 
      @user = User.create(
      first_name: "David",
      last_name: "Fig",
      email: "idc@gmail.com",
      password: "12345678",
      password_confirmation: "12345678"
    )
    end
    it "should return nil if email is missing" do
      @user = User.authenticate_with_credentials(nil, "12345678")
      expect(@user).to eq(nil)
    end

    it "should return nil if email is incorrect" do
      @user = User.authenticate_with_credentials("123@gmail.com", "12345678")
      expect(@user).to eq(nil)
    end

    it "should return nil if password is missing" do
      @user = User.authenticate_with_credentials("idc@gmail.com", nil)
      expect(@user).to eq(nil)
    end

    it "should return nil if password is incorrect" do
      @user = User.authenticate_with_credentials("idc@gmail.com", "12345")
      expect(@user).to eq(nil)
    end

    it "should return the correct user if password and email are correct" do
      @user = User.authenticate_with_credentials("idc@gmail.com", "12345678")
      expect(@user).to_not eq(nil)
      expect(@user.email).to eq("idc@gmail.com")
    end

    it "should return the correct user regardless of case for email" do
      @user = User.authenticate_with_credentials("IDC@GmAiL.cOm", "12345678")
      expect(@user).to_not eq(nil)
      expect(@user.email).to eq("idc@gmail.com")
    end

    it "should return the correct user give extra white space before and after the email" do
      @user = User.authenticate_with_credentials("  idc@gmail.com    ", "12345678")
      expect(@user).to_not eq(nil)
      expect(@user.email).to eq("idc@gmail.com")
    end
  end
end
