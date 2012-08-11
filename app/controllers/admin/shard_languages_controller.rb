class Admin::ShardLanguagesController < Admin::SpaceController
  load_and_authorize_resource
  before_filter :languages, except: [:publish, :destroy, :show]

  def index
    @shard = Shard.find_by_id(params[:shard_id]) || not_found
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @shards }
    end
  end

  def new
    @shard = Shard.find_by_id(params[:shard_id]) || not_found
    @shard_language = ShardLanguage.new
    respond_to do |format|
      format.html { render :form }
      format.json { render json: @shard_language }
    end
  end

  def create
    @shard = Shard.find_by_id(params[:shard_id]) || not_found
    note='Language not found or already exists'
    sl=ShardLanguage.new(params[:shard_language])
    sl.shard=@shard
    respond_to do |format|
      if sl.save
        format.html { redirect_to admin_shard_shard_languages_path(@shard), notice: note }
        format.json { render json: sl, status: :created, location: sl }
      else
        format.html { render :form }
      end
    end
  end

  def destroy
    @shard = Shard.find_by_id(params[:shard_id]) || not_found
    sl=@shard.shard_languages.find(params[:id]) || not_found
    if(sl.destroy)
      note = 'Shard language deleted'
    end
    respond_to do |format|
      format.html { redirect_to admin_shard_shard_languages_path(@shard), notice: note }
    end
  end

  def edit
    @shard = Shard.find_by_id(params[:shard_id]) || not_found
    @shard_language=@shard.shard_languages.find(params[:id]) || not_found
    respond_to do |format|
      format.html { render :form }
    end
  end

  def update
    @shard = Shard.find_by_id(params[:shard_id]) || not_found
    @shard_language=@shard.shard_languages.find(params[:id]) || not_found
    @form_legend = t('admin.shard_language.form_legend.edit')

    respond_to do |format|
      if @shard_language.update_attributes(params[:shard_language])
        format.html { redirect_to admin_shard_shard_languages_path, notice: 'Shard language was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :form }
        format.json { render json: @language.errors, status: :unprocessable_entity }
      end
    end
  end

private

  def languages
    @languages = Language.all
  end
end
