require 'spec_helper'

describe "Страницы пользователя" do

  subject { page }

  describe "страница регистрации" do
    before { visit signup_path }
    
    it { should have_content('Регистрация') }
    it { should have_title('Регистрация') }
  end
end
