ActiveAdmin.register Appointment do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :user_id, :family_member_id, :order_id, :analysis_datetime, :status
  #
  # or
  #
  permit_params do
    permitted = [:user_id, :family_member_id, :order_id, :analysis_datetime, :status]
    permitted << :other if params[:action] == 'create'
    permitted
  end
  
end
