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
  
  def social
    form_field(:social, f.check_box(:social))
  end
  
  def events
    form_field(:events, f.check_box(:events))
  end
  
  def import_enabled
    form_field(:import_enabled, f.check_box(:import_enabled))
  end
end