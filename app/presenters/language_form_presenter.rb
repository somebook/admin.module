class LanguageFormPresenter < BasePresenter
  presents :language
  
  def code
    form_field(:code, f.text_field(:code))
  end

  def name
    form_field(:name, f.text_field(:name))
  end
end