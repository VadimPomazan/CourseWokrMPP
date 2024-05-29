ActiveAdmin.register Analysis do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :name, :description, :price, :type_of_analysis_id
  #
  # or
  #
  permit_params do
    permitted = [:name, :description, :price, :type_of_analysis_id]
    permitted << :other if params[:action] == 'create' 
    permitted
  end
  
end
