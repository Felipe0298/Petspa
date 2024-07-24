class AppoinmentsController < ApplicationController
  before_action :set_appoinment, only: %i[ show edit update destroy ]

  # GET /appoinments or /appoinments.json
  def index
    @appoinments = Appoinment.order(created_at: :desc)
    @pagy, @appoinments = pagy(@appoinments, items: 10)
  end

  # GET /appoinments/1 or /appoinments/1.json
  def show
  end

  # GET /appoinments/new
  def new
    @appoinment = Appoinment.new
    appoinment_type = params[:appoinment_type].gsub("-", " ")
    @appoinment_type = AppoinmentType.find_by(name: appoinment_type)
    @appoinment.payments.build # This line is added to the new action to build a payment object for the appoinment.
  end

  # GET /appoinments/1/edit
  def edit
  end

  # POST /appoinments or /appoinments.json
  def create
    @appoinment = current_user.appoinments.new(appoinment_params.merge(client: current_user))
    @appoinment_type = AppoinmentType.find(params[:appoinment][:appoinment_type_id])

    respond_to do |format|
      if @appoinment.save
        format.html { redirect_to appoinment_url(@appoinment), notice: "Appoinment was successfully created." }
        format.json { render :show, status: :created, location: @appoinment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @appoinment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /appoinments/1 or /appoinments/1.json
  def update
    respond_to do |format|
      if @appoinment.update(appoinment_params)
        format.html { redirect_to appoinments_path, notice: "Appoinment was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appoinments/1 or /appoinments/1.json
  def destroy
    @appoinment.destroy!

    respond_to do |format|
      format.html { redirect_to appoinments_url, notice: "Appoinment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_appoinment
      @appoinment = Appoinment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def appoinment_params
      params.require(:appoinment).permit(
        :status, :appoinment_type_id,
        :start_at, :end_at,
        :notes, :pet_id, :local_id,
        payments_attributes: [:id, :billing_status, :user_id, :receipt, :_destroy]
      )
    end
end