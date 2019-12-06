require 'rails_helper'

# Use factories to make fake records while testing
# Read about create, build, let, let!, create_list, build_list

RSpec.describe User, type: :model do

  it '#ideal user' do
    user =  User.new(name: "Example User", email: "user123@example.com", password: "foobar", password_confirmation: "foobar")
    expect(user.valid?).to be true
  end

  describe '#Validations' do
    context 'when empty parameters' do
      it 'name not present' do
        user =  User.new(name:'', email: 'foo.bar@gmail.com', password: "foobar", password_confirmation: "foobar")
        expect(user.valid?).to be false
      end
      it 'email not present' do
        user =  User.new(name:'Foo Bar', email: '', password: "foobar", password_confirmation: "foobar")
        expect(user.valid?).to be false
      end
      it 'password not present' do
        user =  User.new(name: "Example User", email: "user123@example.com", password: "", password_confirmation: "foobar")
        expect(user.valid?).to be false
      end
    end

    context 'when parameters are too long' do
      it 'name exceeds 20 characters' do
        user =  User.new(name:'Length exceeds 20 characters', email: 'foo.bar@gmail.com', password: "foobar", password_confirmation: "foobar")
        expect(user.valid?).to be false
      end
      it 'email exceeds 20 characters' do
        user =  User.new(name:'Foo Bar', email: 'lengthexceeds20characters@example.com', password: "foobar", password_confirmation: "foobar")
        expect(user.valid?).to be false
      end
    end

    it 'when email is not in proper format' do
      user =  User.new(name:"foo", email: "foo.bargmail.com", password: "foobar", password_confirmation: "foobar")
      expect(user.valid?).to be false
    end

    it 'duplicate email address' do
      user =  User.create(name:"foo", email: "foo.barg@mail.com", password: "foobar", password_confirmation: "foobar")
      new_user = user.dup
      expect(new_user.valid?).to be false
    end
  end
end


