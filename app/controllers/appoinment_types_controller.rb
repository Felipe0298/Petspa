class AppoinmentTypesController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize!
  before_action :set_appoinment_type, only: %i[ show edit update destroy ]

  # GET /appoinment_types or /appoinment_types.json
  def index
    @appoinment_types = AppoinmentType.all
  end

  # GET /appoinment_types/1 or /appoinment_types/1.json
  def show
  end

  # GET /appoinment_types/new
  def new
    @appoinment_type = AppoinmentType.new
  end

  # GET /appoinment_types/1/edit
  def edit
  end

  # POST /appoinment_types or /appoinment_types.json
  def create
    @appoinment_type =current_user.appoinment_types.new(appoinment_type_params.merge(user: current_user))
    respond_to do |format|
      if @appoinment_type.save
        format.html { redirect_to appoinment_type_url(@appoinment_type), notice: "Appoinment type was successfully created." }
        format.json { render :show, status: :created, location: @appoinment_type }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @appoinment_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /appoinment_types/1 or /appoinment_types/1.json
  def update
    respond_to do |format|
      if @appoinment_type.update(appoinment_type_params)
        format.html { redirect_to appoinment_type_url(@appoinment_type), notice: "Appoinment type was successfully updated." }
        format.json { render :show, status: :ok, location: @appoinment_type }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @appoinment_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appoinment_types/1 or /appoinment_types/1.json
  def destroy
    @appoinment_type.destroy!

    respond_to do |format|
      format.html { redirect_to appoinment_types_url, notice: "Appoinment type was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def authorize! record = nil
    is_allowed = if record
      record.user_id == current_user.id
    else
      current_user.admin?
    end

    raise NotAuthorizedError unless is_allowed
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_appoinment_type
      @appoinment_type = AppoinmentType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def appoinment_type_params
      params.require(:appoinment_type).permit(:payment_required, :name, :user_id, :price, :description)
    end
end
