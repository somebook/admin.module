module Admin
class UsersController < SpaceController
  load_and_authorize_resource

  def index
    @users = User.order('id DESC').paginate(page: params[:page], per_page: 30)
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    @form_legend = t("admin.user.form_legend.new")

    render :form
  end

  def edit
    @user = User.find(params[:id])
    @form_legend = t("admin.user.form_legend.edit")

    render :form
  end

  def create
    @user = User.new(params[:user])
    @form_legend = t("admin.user.form_legend.new")

    if @user.save
      shard_roles = @user.all_shard_roles.clone
      @user.roles = shard_roles + Role.global_roles.find_all_by_id(params[:user][:role_ids])
      redirect_to users_path, notice: t("admin.user.notice.create_success")
    else
      render :form
    end
  end

  def update
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end

    @user = User.find(params[:id])
    @form_legend = t("admin.user.form_legend.edit")

    if @user.update_attributes(params[:user])
      shard_roles = @user.all_shard_roles.clone
      @user.roles = shard_roles + Role.global_roles.find_all_by_id(params[:user][:role_ids])
      redirect_to users_path, notice: t("admin.user.notice.update_success")
    else
      render :form
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to users_path, notice: t("admin.user.notice.delete_success")
  end

end
end
