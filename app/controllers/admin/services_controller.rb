module Admin
class ServicesController < SpaceController
  load_and_authorize_resource

  def index
    @services = Service.all
  end

  def show
    @service = Service.find(params[:id])
  end

  def new
    @service = Service.new
    @form_legend = t("admin.service.form_legend.new")

    render :form
  end

  # GET /services/1/edit
  def edit
    @service = Service.find(params[:id])
    @form_legend = t("admin.service.form_legend.edit")

    render :form
  end

  def create
    @service = Service.new(params[:service])
    @form_legend = t("admin.service.form_legend.new")

    if @service.save
      redirect_to admin_services_path, notice: t("admin.service.notice.create_success")
    else
      render :form
    end
  end

  def update
    @service = Service.find(params[:id])
    @form_legend = t("admin.service.form_legend.edit")

    if @service.update_attributes(params[:service])
      redirect_to admin_services_path, notice: t("admin.service.notice.update_success")
    else
      render :form
    end
  end

  def destroy
    @service = Service.find(params[:id])
    @service.destroy

    redirect_to admin_services_path, notice: t("admin.service.notice.delete_success")
  end

end
end
