require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "valid user" do
    @user = User.new(username: "Linhng", email: "test100@test.com", password: "Abcxyz100!")
    assert @user.valid?
  end
  
  test "invalid password user 1" do
    @user = User.new(username: "Linhng", email: "test100@test.com", password: "12323232")
    assert !@user.valid?
  end
  
  test "invalid password user 2" do
    @user = User.new(username: "Linhng", email: "test100@test.com", password: "asbdh")
    assert !@user.valid?
  end
  
  test "invalid password user 3" do
    @user = User.new(username: "Linhng", email: "test100@test.com", password: "ASbdhgb")
    assert !@user.valid?
  end
  
  test "invalid password user 4" do
    @user = User.new(username: "Linhng", email: "test100@test.com", password: " ")
    assert !@user.valid?
  end
  
  test "invalid password user 5" do
    @user = User.new(username: "Linhng", email: "test100@test.com", password: "!dn")
    assert !@user.valid?
  end
  
  test "invalid email user" do
    @user = User.new(username: "Linhng", email: "dnsa", password: "Abcxyz100!")
    assert !@user.valid?
  end
  
  test "invalid username user 1" do
    @user = User.new(username: " ", email: "test100@test.com", password: "Abcxyz100!")
    assert !@user.valid?
  end
  
  test "invalid username user 2" do
    @user = User.new(username: "Asncsdjcnsjdncjsdncjs ", email: "test100@test.com", password: "Abcxyz100!")
    assert !@user.valid?
  end
end
