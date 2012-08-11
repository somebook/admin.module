class Admin::UsersController < Admin::SpaceController
  load_and_authorize_resource
  # GET /services
  # GET /services.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /services/1
  # GET /services/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /services/new
  # GET /services/new.json
  def new
    @user = User.new
    @form_legend = t('admin.user.form_legend.new')

    respond_to do |format|
      format.html { render :form }
      format.json { render json: @user }
    end
  end

  # GET /services/1/edit
  def edit
    @user = User.find(params[:id])
    @form_legend = t('admin.user.form_legend.edit')

    respond_to do |format|
      format.html { render :form }
    end
  end

  # POST /services
  # POST /services.json
  def create
    @user = User.new(params[:user])
    @form_legend = t('admin.user.form_legend.new')

    respond_to do |format|
      if @user.save
        sr=@user.all_shard_roles.clone
        @user.roles = sr+Role.global_roles.find_all_by_id(params[:user][:role_ids])
        format.html { redirect_to admin_users_path, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render :form }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /services/1
  # PUT /services/1.json
  def update
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
    @user = User.find(params[:id])
    @form_legend = translate('admin.user.form_legend.edit')

    respond_to do |format|
      if @user.update_attributes(params[:user])
        sr=@user.all_shard_roles.clone
        @user.roles = sr+Role.global_roles.find_all_by_id(params[:user][:role_ids])
        format.html { redirect_to admin_users_path, notice: 'User was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :form }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /services/1
  # DELETE /services/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to admin_users_path, notice: 'User was successfully deleted.'}
      format.json { head :ok }
    end
  end
end
