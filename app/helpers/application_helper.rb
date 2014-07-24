module ApplicationHelper
  # Returns the full title on a per-page basic.
  def fix_title(page_title) # Определение метода
    # Назначение переменной
    if signed_in?
      base_title = "Главная"
    else     
      base_title = "Приложение B"
    end
    if page_title.empty? # Булевый тест
      base_title # Явное возвращение
    else
      page_title
    end
  end
end
