class Admin::LanguagesController < Admin::SpaceController
  # GET /languages
  # GET /languages.json
  #TODO fix this stuff - it's broken some times
  load_and_authorize_resource
  def index
    @languages = Language.all#where(user_id: current_user.id)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @languages }
    end
    #ap @facebook_session
  end

  # GET /languages/1
  # GET /languages/1.json
  def show
    @language = Language.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @language }
    end
  end

  # GET /languages/new
  # GET /languages/new.json
  def new
    @language = Language.new
    @form_legend = t('admin.language.form_legend.new')

    respond_to do |format|
      format.html { render :form }
      format.json { render json: @language }
    end
  end

  # GET /languages/1/edit
  def edit
    @language = Language.find_by_id(params[:id]) || not_found
    @form_legend = t('admin.language.form_legend.edit')

    respond_to do |format|
      format.html { render :form }
    end
  end

  # POST /languages
  # POST /languages.json
  def create
    @language = Language.new(params[:language])
    @form_legend = t('admin.language.form_legend.new')

    respond_to do |format|
      if @language.save
        format.html { redirect_to admin_languages_path, notice: 'language was successfully created.' }
        format.json { render json: @language, status: :created, location: @language }
      else
        format.html { render :form }
        format.json { render json: @language.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /languages/1
  # PUT /languages/1.json
  def update
    @language = Language.find_by_id(params[:id]) || not_found
    @form_legend = t('admin.language.form_legend.edit')

    respond_to do |format|
      if @language.update_attributes(params[:language])
        format.html { redirect_to admin_languages_path, notice: 'language was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :form }
        format.json { render json: @language.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /languages/1
  # DELETE /languages/1.json
  def destroy
    @language = Language.find_by_id(params[:id]) || not_found
    @language.destroy

    respond_to do |format|
      format.html { redirect_to admin_languages_path, notice: 'language was successfully deleted.' }
      format.json { head :ok }
    end
  end
end
