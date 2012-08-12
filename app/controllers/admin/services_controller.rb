class Admin::ServicesController < Admin::SpaceController
  load_and_authorize_resource

  # GET /services
  # GET /services.json
  def index
    @services = Service.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @services }
    end
  end

  # GET /services/1
  # GET /services/1.json
  def show
    @service = Service.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @service }
    end
  end

  # GET /services/new
  # GET /services/new.json
  def new
    @service = Service.new
    @form_legend = translate('admin.service.form_legend.new')

    respond_to do |format|
      format.html { render :form }
      format.json { render json: @service }
    end
  end

  # GET /services/1/edit
  def edit
    @service = Service.find(params[:id])
    @form_legend = translate('admin.service.form_legend.edit')

    respond_to do |format|
      format.html { render :form }
    end
  end

  # POST /services
  # POST /services.json
  def create
    @service = Service.new(params[:service])
    @form_legend = translate('admin.service.form_legend.new')

    respond_to do |format|
      if @service.save
        format.html { redirect_to admin_services_path, notice: 'Service was successfully created.' }
        format.json { render json: @service, status: :created, location: @service }
      else
        format.html { render :form }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /services/1
  # PUT /services/1.json
  def update
    @service = Service.find(params[:id])
    @form_legend = translate('admin.service.form_legend.edit')

    respond_to do |format|
      if @service.update_attributes(params[:service])
        format.html { redirect_to admin_services_path, notice: 'Service was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :form }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /services/1
  # DELETE /services/1.json
  def destroy
    @service = Service.find(params[:id])
    @service.destroy

    respond_to do |format|
      format.html { redirect_to admin_services_path, notice: 'Service was successfully deleted.'}
      format.json { head :ok }
    end
  end
end
