class PagesController < ApplicationController
  def home
    if params[:search].present?
      @analysis = Analysis.joins(:type_of_analysis).where("analyses.name ILIKE :search OR type_of_analyses.name ILIKE :search", search: "%#{params[:search]}%")
    else
      @analysis = Analysis.all
    end

    @type_of_analysis = TypeOfAnalysis.all
  end
end
