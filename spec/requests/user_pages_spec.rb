require 'spec_helper'

describe "Страницы пользователя" do

  subject { page }

  describe "страница регистрации" do
    before { visit signup_path }
    
    let(:submit) { "Создать аккаунт" }
    
    describe "если информация невалидна" do
      it "пользователь не создается" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "если информация валидна" do
      before do
        fill_in "Name",         with: "Example User"
        fill_in "Email",        with: "user@example.com"
        fill_in "Password",     with: "foobar"
        fill_in "Confirmation", with: "foobar"
      end

      it "создается пользователь" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
    end
  end
  
  describe "страница профиля" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }
    
    it { should have_title(user.name) }
    it { should have_content(user.name) }
  end
end