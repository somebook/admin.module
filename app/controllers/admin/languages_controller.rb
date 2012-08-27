module Admin
class LanguagesController < SpaceController
  load_and_authorize_resource
  # TODO: fix this stuff - it's broken some times

  def index
    @languages = Language.all # where(user_id: current_user.id)
  end

  def show
    @language = Language.find(params[:id])
  end

  def new
    @language = Language.new
    @form_legend = t('admin.language.form_legend.new')

    render :form
  end

  def edit
    @language = Language.find_by_id(params[:id]) || not_found
    @form_legend = t("admin.language.form_legend.edit")

    render :form
  end

  def create
    @language = Language.new(params[:language])
    @form_legend = t("admin.language.form_legend.new")

    if @language.save
      redirect_to languages_path, notice: t("admin.language.notice.create_success")
    else
      render :form
    end
  end

  def update
    @language = Language.find_by_id(params[:id]) || not_found
    @form_legend = t('admin.language.form_legend.edit')

    if @language.update_attributes(params[:language])
      redirect_to languages_path, notice: t("admin.language.notice.update_success")
    else
      render :form
    end
  end

  def destroy
    @language = Language.find_by_id(params[:id]) || not_found
    @language.destroy

    redirect_to languages_path, notice: t("admin.language.notice.delete_success")
  end

end
end
