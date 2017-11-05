require 'rails_helper'

describe User do
  it 'is valid with a username and email' do
    user = User.new(
      username: 'johndoe',
      email: 'tester@example.com',
      password: '123456')
    expect(user).to be_valid
  end

  it 'is invalid with a username more than 50 char' do
    user = User.new(
      username: '76BoMtR0IsoDSCzNHZKDPgxcW83m62IStMKGtXEOZgKLsX8e6ce',
      email: 'tester@example.com',
      password: '123456')
    expect(user).to be_invalid
  end

  it 'is invalid without a username' do
    user = User.new(username: nil)
      user.valid?
    expect(user.errors[:username]).to include('can\'t be blank')
  end

  it 'is invalid without an email address' do
    user = User.new(
      username: 'johndoe',
      email: nil,
      password: '123456')
    expect(user).to be_invalid
  end

  it 'is invalid without a password' do
    user = User.new(
      username: 'johndoe',
      email: 'tester@example.com',
      password: nil)
    expect(user).to be_invalid
  end

  # it 'is invalid with a duplicate email address' do
  #   User.create(
  #     username: 'tester',
  #     email: 'tester@example.com'
  #     )
  #   user = User.new(
  #     username: 'tester',
  #     email: 'tester@example.com'
  #     )
  #   user.valid?
  #   expect(user.errors[:email]).to include('has already been taken')
  # end

  it 'return\'s a new user\'s post karma as 0' do
    user = User.new(
      username: 'johndoe',
      email: 'tester@example.com',
      password: '123456')
    expect(user.post_karma).to eq 0
  end

  it 'return\'s a new user\'s comment karma as 0' do
    user = User.new(
      username: 'johndoe',
      email: 'tester@example.com',
      password: '123456')
    expect(user.comment_karma).to eq 0
  end

end
