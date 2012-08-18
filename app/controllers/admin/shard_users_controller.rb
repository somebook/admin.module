class Admin::ShardUsersController < Admin::SpaceController
  load_and_authorize_resource class: :Assignment

  def index
    @shard = Shard.find_by_id(params[:shard_id]) || not_found
  end

  def add
    @shard = Shard.find_by_id(params[:shard_id]) || not_found
    notice = t("admin.shard_user.notice.add_fail")

    Role.shard_roles.where("id in (?)", params[:role_ids]).each do |role|
      if user = User.find_by_email(params[:user_email])) and !user.has_role_for_shard?(role, @shard)
        notice = t("admin.shard_user.notice.add_success")
        user.assignments.create(
          role: role,
          shard: @shard
        )
      end
    end

    redirect_to admin_shard_shard_users_path(@shard), notice: notice
  end

  def revoke
    @shard = Shard.find_by_id(params[:shard_id]) || not_found
    assignment = @shard.assignments.find(params[:assignment_id]) || not_found
    notice = t("admin.shard_user.notice.revoke_fail")

    if assignment.destroy
      notice = t("admin.shard_user.notice.revoke_success")
    end

    redirect_to admin_shard_shard_users_path(@shard), notice: notice
  end

end
end
