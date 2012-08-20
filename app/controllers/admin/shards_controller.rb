module Admin
class ShardsController < SpaceController
  load_and_authorize_resource
  #TODO fix this stuff - it's broken some times

  def index
    @shards = Shard.all # where(user_id: current_user.id)
  end

  def show
    @shard = Shard.find(params[:id]) || not_found
  end

  def new
    @shard = Shard.new
    @form_legend = t("admin.shard.form_legend.new")

    render :form
  end

  def edit
    @shard = Shard.find_by_id(params[:id]) || not_found
    @form_legend = t("admin.shard.form_legend.edit")

    render :form
  end

  def create
    @shard = Shard.new(params[:shard])
    @form_legend = t("admin.shard.form_legend.new")

    if @shard.save
      redirect_to shards_path, t("admin.shard.notice.create_success")
    else
      render :form
    end
  end

  def update
    @shard = Shard.find_by_id(params[:id]) || not_found
    @form_legend = t("admin.shard.form_legend.edit")

    if @shard.update_attributes(params[:shard])
      redirect_to shards_path, notice: t("admin.shard.notice.update_success")
    else
      render :form
    end
  end

  def destroy
    @shard = Shard.find_by_id(params[:id]) || not_found
    @shard.destroy

    redirect_to shards_path, notice: t("admin.shard.notice.delete_success")
  end

end
end
