require 'spec_helper'

describe "Статические страницы" do

  subject { page }
  
  describe "Начальная страница" do
    before { visit root_path }
          
    it "проверка на наличие 'Приложение B'" do     
      expect(page).to have_content('Приложение "B"')
    end
    
    it "проверка кнопки \"Зарегистрироваться!\"" do
      click_link "Зарегистрироваться!"
      expect(page).to have_title('Регистрация')
    end
    
    it "проверка кнопки \"Зайти под именем\"" do
      click_link "Зайти под именем"
      expect(page).to have_title('Аутентификация')
    end
    
    describe "для зарегистрированных пользователей" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        visit signin_path
        fill_in "Электронный адрес",    with: user.email.upcase
        fill_in "Пароль", with: user.password
        click_button "Вход"
      end
      
      it "проверка на наличие 'Главная'" do     
	     expect(page).to have_content('Главная')
	    end
	    
	    describe "проверка для корневой страницы" do
	      before { visit root_path }
	      
  	    it "проверка кнопки \"Мой профиль\"" do
  		    click_link "Мой профиль"
   		    expect(page).to have_title('Пользователь:')
  	  	end
  		  
  		  it "проверка кнопки \"Зайти под именем\"" do
  		    click_link "Закрыть сессию"
  		    expect(page).to have_title('Приложение B')
  		  end      
	    end
    end
  end
end
