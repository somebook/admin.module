module Admin
class ShardUsersController < SpaceController
  load_and_authorize_resource class: "Assignment"
  before_filter do
    @shard = Shard.find_by_id(params[:shard_id]) || not_found
    @roles = Role.all
  end

  def index
    @shard_users = @shard.users
  end

  def new
    @form_legend = t("admin.shard_user.form_legend.new")
    @shard_user = ShardUser.new(id: nil, shard_id: @shard.id)

    render :form
  end

  def create
    @shard_user = ShardUser.new(params[:shard_user])
    @shard_user.shard_id = @shard.id
    @form_legend = t("admin.shard_user.form_legend.new")

    if @shard_user.save
      redirect_to shard_shard_users_path(@shard), notice: t("admin.shard_user.notice.create_success")
    else
      render :form
    end
  end

  def edit
    @user = User.find_by_id(params[:id]) || not_found
    @shard_user = ShardUser.get(@user, @shard)

    @form_legend = t("admin.shard_user.form_legend.edit")
    @roles = Role.all

    render :form
  end

  def update
    @user = User.find_by_id(params[:id]) || not_found
    @shard_user = ShardUser.get(@user, @shard) || not_found
    @form_legend = t("admin.shard_user.form_legend.edit")

    if @shard_user.update_attributes(params[:shard_user])
      redirect_to shard_shard_users_path(@shard), notice: t("admin.shard_user.notice.update_success")
    else
      render :form
    end
  end

  def destroy
    @user = User.find_by_id(params[:id]) || not_found
    @shard_user = ShardUser.get(@user, @shard) || not_found
    @shard_user.destroy

    redirect_to shard_shard_users_path(@shard), notice: t("admin.shard_user.notice.delete_success")
  end

end
end
