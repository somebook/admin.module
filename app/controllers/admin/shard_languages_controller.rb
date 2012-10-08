module Admin
class ShardLanguagesController < SpaceController
  load_and_authorize_resource
  before_filter :languages, except: [:destroy, :show]

  def index
    @shard = Shard.find_by_id(params[:shard_id]) || not_found
  end

  def new
    @shard = Shard.find_by_id(params[:shard_id]) || not_found
    @shard_language = ShardLanguage.new
    @form_legend = t("admin.shard_language.form_legend.new")

    render :form
  end

  def create
    @shard = Shard.find_by_id(params[:shard_id]) || not_found
    shard_language = ShardLanguage.new(params[:shard_language])
    shard_language.shard = @shard
    @form_legend = t("admin.shard_language.form_legend.new")

    if shard_language.save
      redirect_to shard_shard_languages_path(@shard), notice: t("admin.shard_language.notice.create_success")
    else
      render :form
    end
  end

  def edit
    @shard = Shard.find_by_id(params[:shard_id]) || not_found
    @shard_language = @shard.shard_languages.find(params[:id]) || not_found
    @form_legend = t("admin.shard_language.form_legend.edit")

    render :form
  end

  def update
    @shard = Shard.find_by_id(params[:shard_id]) || not_found
    @shard_language = @shard.shard_languages.find(params[:id]) || not_found
    @form_legend = t("admin.shard_language.form_legend.edit")

    if @shard_language.update_attributes(params[:shard_language])
      redirect_to shard_shard_languages_path, notice: t("admin.shard_language.notice.update_success")
    else
      render :form
    end
  end

  def destroy
    @shard = Shard.find_by_id(params[:shard_id]) || not_found
    shard_language = @shard.shard_languages.find(params[:id]) || not_found

    shard_language.destroy
    redirect_to shard_shard_languages_path(@shard), notice: t("admin.shard_language.notice.delete_success")
  end

private

  def languages
    @languages = Language.all
  end

end
end
