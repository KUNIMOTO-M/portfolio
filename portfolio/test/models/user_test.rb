require "test_helper"

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new( name: "sample", email: "sample@co.jp",
                      password: "masarumosu", password_confirmation: "masarumosu")
  end
  

  test "valid user" do
    assert @user.valid?
  end

  test "unvalid name" do
    @user.name = ""
    assert_not @user.valid?
  end

  test "unvalid email" do
    @user.email = ""
    assert_not @user.valid?
  end

  test "password is nil" do
    @user.password = ""
    @user.password_confirmation = ""
    assert_not @user.valid?
  end

  test "password dose not much password_confirmation " do
    @user.password = "foobar"
    assert_not @user.valid?
  end

  test "regex of email is valid" do
    @user.password = "sample"
    assert_not @user.valid?
  end

  test "email should unique" do
    duplicate_user = @user.dup
    @user.save
    assert_not duplicate_user.valid?
  end

   
  test "name should not be too long " do
    @user.name = "a" * 51
    assert_not @user.valid?
  end
  
  test "email should not be too long" do
    @user.email = "a" * 244 + "@example.com"
    assert_not @user.valid?
  end
  
  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect}  be valid"
    end
    
  end

   
  test "email validation should reject invalid addresses " do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com foo@bar..com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end


end
