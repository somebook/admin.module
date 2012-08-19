class ServiceFormPresenter < BasePresenter
  presents :service

  def name
    form_field(:name, f.text_field(:name))
  end

  def code
  	form_field(:code, f.text_field(:code))
  end
  
  def password_auth
    form_field(:password_auth, f.check_box(:password_auth))
  end
end