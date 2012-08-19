class UserFormPresenter < BasePresenter
  presents :user

  def email
    form_field(:email, f.text_field(:email))
  end

  def roles
    roles = Role.global_roles
    form_multiple(:roles, roles.map { |role|
      [check_box_tag("user[role_ids][]", role.id, user.roles.include?(role)), t("admin.role.#{role.name}")]
    } )
  end

  def password
    form_field(:password, f.password_field(:password))
  end

  def password_confirmation
    form_field(:password_confirmation, f.password_field(:password_confirmation))
  end

  def languages
    languages = Language.all
    form_multiple(:languages,
        languages.map {|language| [ check_box_tag("user[languages_ids][]", language.id, user.languages.include?(language)), language.name ] }
      )
  end
end
