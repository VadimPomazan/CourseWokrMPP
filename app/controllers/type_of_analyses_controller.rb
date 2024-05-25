class TypeOfAnalysesController < ApplicationController
  before_action :set_type_of_analysis, only: %i[ show edit update destroy ]

  # GET /type_of_analyses or /type_of_analyses.json
  def index
    @type_of_analyses = TypeOfAnalysis.all
  end

  # GET /type_of_analyses/1 or /type_of_analyses/1.json
  def show
  end

  # GET /type_of_analyses/new
  def new
    @type_of_analysis = TypeOfAnalysis.new
  end

  # GET /type_of_analyses/1/edit
  def edit
  end

  # POST /type_of_analyses or /type_of_analyses.json
  def create
    @type_of_analysis = TypeOfAnalysis.new(type_of_analysis_params)

    respond_to do |format|
      if @type_of_analysis.save
        format.html { redirect_to type_of_analysis_url(@type_of_analysis), notice: "Type of analysis was successfully created." }
        format.json { render :show, status: :created, location: @type_of_analysis }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @type_of_analysis.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /type_of_analyses/1 or /type_of_analyses/1.json
  def update
    respond_to do |format|
      if @type_of_analysis.update(type_of_analysis_params)
        format.html { redirect_to type_of_analysis_url(@type_of_analysis), notice: "Type of analysis was successfully updated." }
        format.json { render :show, status: :ok, location: @type_of_analysis }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @type_of_analysis.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /type_of_analyses/1 or /type_of_analyses/1.json
  def destroy
    @type_of_analysis.destroy!

    respond_to do |format|
      format.html { redirect_to type_of_analyses_url, notice: "Type of analysis was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type_of_analysis
      @type_of_analysis = TypeOfAnalysis.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def type_of_analysis_params
      params.require(:type_of_analysis).permit(:name)
    end
end
