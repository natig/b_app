require 'spec_helper'

describe "Статические страницы" do
  describe "Начальная страница" do
    it "проверка на наличие 'Приложение B'" do
      visit '/static_pages/home'
      expect(page).to have_content('Приложение "B"')
    end
  end
end
