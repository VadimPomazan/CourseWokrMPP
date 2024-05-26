class PagesController < ApplicationController
  def home
    @analysis = Analysis.all
    @type_of_analysis = TypeOfAnalysis.all
  end
end
