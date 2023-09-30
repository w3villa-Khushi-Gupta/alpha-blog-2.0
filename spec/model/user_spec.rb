require 'rails_helper'

RSpec.describe User, type: :model do

        before(:all) do
                @user = User.create(username:"tesiiiiiiiiiiiiiiiiiiiii",password:"12345678",email:"testuser@gmail.com",phone_no:"1234567809")
        end
        context 'For username PRESENCE' do
                it 'checking for the existence of username' do
                        users = User.get_all_name
                        expect(User.get_all_name).to eq ["testuser1","testuser2"]
                end
        end
        context 'For username LENGTH criteria' do
                it 'checking for the appropriate length of username' do
                        expect(@user.errors.messages).to eq ""
                end
                it 'checking for too long length of username' do
                        expect(@user.error.messages[:username]).to eq  ["is too long (maximum is 10 characters)"]
                end
                it 'checking for the too short length of username' do
                        expect(@user.errors.messages[:username]).to eq ["is too short (minimum is 5 characters)"]
                end
        end
        context 'For email presence' do
                it 'checking the existence of username' do
                        expect(@user.email).to eq "testuser@gmail.com"
                end
        end
        
        
        it 'checking for valid email addresses' do
                user = User.create("username":"testuser","password":"12345678","email":"testuser@gmail.com","phone_no":"1234567890")
                email = User.check_email_validation
                email.each do |eml|
                        expect(eml.length).to be_between(10, 100).inclusive
                end
        end

        it 'checking for valid phone number' do
                number = User.check_valid_phone_no
                number.each do |ph|
                        expect(ph.length).to eq 10
                end
        end
end