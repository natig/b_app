require 'spec_helper'

describe User do
  
  before do
    @user = User.new(name: "Example User", email: "user@example.com",
                     password: "foobar123123",
                     password_confirmation: "foobar123123")    
  end
  
  subject { @user }
  
  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:encrypted_password) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:remember_token) }
  it { should respond_to(:current_sign_in_at) }
  
  it { should be_valid }
  
  describe "если имя указанно неверно" do
    before { @user.name = " " }
    it { should_not be_valid }
  end
  
  describe "если адрес эл. почты указан неверно" do
    before { @user.email = " " }
    it { should_not be_valid }
  end
  
  describe "если имя превышает длину" do
    before { @user.name = "a" * 51 }
    it { should_not be_valid }
  end
  
  describe "если формат email невалиден" do
    it "должен считаться недействительным" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        @user.email = invalid_address
        expect(@user).not_to be_valid
      end
    end
  end

  describe "если формат email валиден" do
    it "должен считаться действительным" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @user.email = valid_address
        expect(@user).to be_valid
      end
    end
  end
  
  describe "если email адрес уже занят" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.email = @user.email.upcase
      user_with_same_email.save
    end

    it { should_not be_valid }
  end  
  
  describe "если пароль отсутствует" do
    before do
      @user = User.new(name: "Example User", email: "user@example.com",
                       password: " ", password_confirmation: " ")
    end
    it { should_not be_valid }
  end

  describe "если пароль не совпадает с подтверждением" do
    before { @user.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end
  
  describe "слишком короткий пароль" do
    before { @user.password = @user.password_confirmation = "a" * 7 }
    it { should be_invalid }
  end

  describe "возвращаемое значение проверки подлинности" do
    before { @user.save }
    let(:found_user) { User.find_by(email: @user.email) }

    describe "когда пароль валидный" do
      it { should eq found_user.authenticate(@user.password) }
    end

    describe "когда пароль невалидный" do
      let(:user_for_invalid_password) { found_user.authenticate("invalid") }

      it { should_not eq user_for_invalid_password }
      specify { expect(user_for_invalid_password).to be_false }
    end
  end
  
  describe "remember token" do
    before { @user.save }
    its(:remember_token) { should_not be_blank }
  end
end
