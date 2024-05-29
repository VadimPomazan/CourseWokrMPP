ActiveAdmin.register FamilyMember do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :user_id, :person_id, :family_member_name
  #
  # or
  #
  permit_params do
    permitted = [:user_id, :person_id, :family_member_name]
    permitted << :other if params[:action] == 'create'
    permitted
  end
  
end
