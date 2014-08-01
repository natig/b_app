require 'spec_helper'

describe "Страницы пользователя" do

  subject { page }

  describe "страница регистрации" do
    before { visit '/users/sign_up' }
    
    it { should have_title('Регистрация') }
    it { should have_content('Регистрация') }
    
    let(:submit) { "Создать аккаунт" }
    
    describe "если информация невалидна" do
      it "пользователь не создается" do
        expect { click_button submit }.not_to change(User, :count)
      end
      
      describe "после отправки" do
        before { click_button submit }
        
        it { should have_title('Регистрация') }
        it { should have_content('error') }
      end
    end

    describe "если информация валидна" do
      before do
        fill_in "Имя",               with: "Example User"
        fill_in "Электронный адрес", with: "user@example.com"
        fill_in "Пароль",            with: "foobar123123"
        fill_in "Повторение пароля", with: "foobar123123"
      end

      it "создается пользователь" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
      
      describe "после сохранения данных пользователя" do
        before { click_button submit }
        let(:user) { User.find_by(email: 'user@example.com') }
        
        it { should have_title(user.name) }
        it { should have_selector('div.alert.alert-success',
                                  text: "Добро") }
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