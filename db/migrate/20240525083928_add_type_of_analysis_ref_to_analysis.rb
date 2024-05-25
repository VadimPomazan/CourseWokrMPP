class AddTypeOfAnalysisRefToAnalysis < ActiveRecord::Migration[6.0]
  def change
    add_reference :analyses, :type_of_analysis, foreign_key: true
  end
end
