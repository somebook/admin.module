class Admin::ShardsController < Admin::SpaceController
  load_and_authorize_resource
  #TODO fix this stuff - it's broken some times
  # load_and_authorize_resource
  def index
    @shards = Shard.all#where(user_id: current_user.id)
    @roles = Role.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @shards }
    end
  end

  def show
    @shard = Shard.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @shard }
    end
  end

  def new
    @shard = Shard.new
    @form_legend = t('admin.shard.form_legend.new')

    respond_to do |format|
      format.html { render :form }
      format.json { render json: @shard }
    end
  end

  def edit
    @shard = Shard.find_by_id(params[:id]) || not_found
    @form_legend = t('admin.shard.form_legend.edit')

    respond_to do |format|
      format.html { render :form }
    end
  end

  def create
    @shard = Shard.new(params[:shard])
    @form_legend = t('admin.shard.form_legend.new')

    respond_to do |format|
      if @shard.save
        format.html { redirect_to admin_shards_path, notice: 'shard was successfully created.' }
        format.json { render json: @shard, status: :created, location: @shard }
      else
        format.html { render :form }
        format.json { render json: @shard.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @shard = Shard.find_by_id(params[:id]) || not_found
    @form_legend = t('admin.shard.form_legend.edit')

    respond_to do |format|
      if @shard.update_attributes(params[:shard])
        format.html { redirect_to admin_shards_path, notice: 'shard was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :form }
        format.json { render json: @shard.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @shard = Shard.find_by_id(params[:id]) || not_found
    @shard.destroy

    respond_to do |format|
      format.html { redirect_to admin_shards_path, notice: 'shard was successfully deleted.' }
      format.json { head :ok }
    end
  end

end
