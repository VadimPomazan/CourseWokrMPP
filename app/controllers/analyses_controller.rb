class AnalysesController < ApplicationController
  before_action :set_analysis, only: %i[ show edit update destroy ]

  # GET /analyses or /analyses.json
  def index
    @order_id = params[:order_id]
    if params[:search].present?
      @order_id = params[:order_id]
      @analysis = Analysis.joins(:type_of_analysis).where("analyses.name ILIKE :search OR type_of_analyses.name ILIKE :search", search: "%#{params[:search]}%")
    else
      @analysis = Analysis.all
    end

    Rails.logger.debug("Order ID: #{@order_id}")
    @type_of_analysis = TypeOfAnalysis.all

  end

  # GET /analyses/1 or /analyses/1.json
  def show
  end

  # GET /analyses/new
  def new
    @analysis = Analysis.new
  end

  # GET /analyses/1/edit
  def edit
  end

  # POST /analyses or /analyses.json
  def create
    @analysis = Analysis.new(analysis_params)

    respond_to do |format|
      if @analysis.save
        format.html { redirect_to analysis_url(@analysis), notice: "Analysis was successfully created." }
        format.json { render :show, status: :created, location: @analysis }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @analysis.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /analyses/1 or /analyses/1.json
  def update
    respond_to do |format|
      if @analysis.update(analysis_params)
        format.html { redirect_to analysis_url(@analysis), notice: "Analysis was successfully updated." }
        format.json { render :show, status: :ok, location: @analysis }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @analysis.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /analyses/1 or /analyses/1.json
  def destroy
    @analysis.destroy!

    respond_to do |format|
      format.html { redirect_to analyses_url, notice: "Analysis was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_analysis
    @analysis = Analysis.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def analysis_params
    params.require(:analysis).permit(:name, :description, :price, :type_of_analysis_id)
  end
end
