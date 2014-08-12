require 'spec_helper'

describe "Аутентификации" do  

  subject { page }
  
  describe "Страница аутентификации" do
    before { visit new_user_session_path }
    
    it { should have_title('Аутентификация') }
    it { should have_content('Вход') }
    
    describe "невалидная аутентификация" do      
      before { click_button "Вход" }
      
      it { should have_title('Аутентификация') }
      it { should have_selector('div.alert.alert-error') }      
    end
    
    describe "валидная информация" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        fill_in "Электронный адрес", with: user.email.upcase
	      fill_in "Пароль",            with: user.password
	      click_button "Вход"
      end   
        it { should have_link('Главная') }
        it { should have_title(user.name) }

      describe "теперь выход" do
        before do
          visit root_path
          click_link "Закрыть сессию"
        end
        it { should have_link('Зайти под именем') }
      end    
    end
  end
end
