class ShardUserFormPresenter < BasePresenter
  presents :shard_user

  def email
    form_field(:email, f.text_field(:email))
  end

  def roles(roles)
    form_field(:role_ids, f.select(:role_ids,
      roles
        .delete_if{ |role| role.name == "admin"}
        .collect{ |role| [t("admin.role.#{role.name}"), role.id] },
      {}, multiple: true))
  end

end
