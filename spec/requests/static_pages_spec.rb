require 'spec_helper'

describe "Статические страницы" do

  subject { page }
  
  describe "Начальная страница" do
    before { visit root_path }
  
    it { expect(page).to have_title('Главная') }
          
    it "проверка на наличие 'Приложение B'" do     
      expect(page).to have_content('Приложение "B"')
    end
  end
end
