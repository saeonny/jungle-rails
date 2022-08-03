require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do

    it 'should be able to save if password and password_confirmation are matched and all other fields are filled' do
      new_user = User.new({
        firstname: 'firstname', 
        lastname: 'last name',
        email: "email@gmail.com",
        password: "password",
        password_confirmation: "password"
      })
      expect(new_user).to be_valid
    end

    it 'should not be able to save if password and password_confirmation are not matched' do
      new_user = User.new({
        firstname: 'firstname', 
        lastname: 'last name',
        email: "email@gmail.com",
        password: "password",
        password_confirmation: "passwordddd"
      })
      expect(new_user).not_to be_valid
    end


    it 'should not be able to save if password minimum length is less than 6' do
      new_user = User.new({
        firstname: 'firstname', 
        lastname: 'last name',
        email: "email@gmail.com",
        password: "pass",
        password_confirmation: "pass"
      })
      expect(new_user).not_to be_valid
    end

    it 'should not be able to save if email is not unique' do
      user1 = User.new({
        firstname: 'firstname', 
        lastname: 'last name',
        email: "email@gmail.com",
        password: "password",
        password_confirmation: "password"
      })
      user1.save

      user2 = User.new({
        firstname: 'firstname', 
        lastname: 'last name',
        email: "email@gmail.com",
        password: "password",
        password_confirmation: "password"
      })
      user2.save

      expect(user2).not_to be_valid
    end
  end

    describe 'authentications' do
      it 'should be able to login if password and email are match' do

        new_user = User.new({
          firstname: 'firstname',
          lastname: 'lastname',
          email: 'email@gmail.com',
          password: 'password',
          password_confirmation: 'password'
        })
        new_user.save
        valid_user = User.authenticate_with_credentials('email@gmail.com', 'password')
        expect(valid_user).to eq(new_user)
      end


      it 'should be not able to login if password and email are not match' do

        new_user = User.new({
          firstname: 'firstname',
          lastname: 'lastname',
          email: 'email@gmail.com',
          password: 'password',
          password_confirmation: 'password'
        })
        new_user.save
        valid_user = User.authenticate_with_credentials('email@gmail.com', 'passworddd')
        expect(valid_user).not_to eq(new_user)
      end


      it 'should be able to login regardless email that upper or lower or spaces ' do

        new_user = User.new({
          firstname: 'firstname',
          lastname: 'lastname',
          email: 'email@gmail.com',
          password: 'password',
          password_confirmation: 'password'
        })
        new_user.save
        valid_user = User.authenticate_with_credentials('email@Gmail.Com  ', 'password')
        expect(valid_user).to eq(new_user)
      end
    end

    




  
end