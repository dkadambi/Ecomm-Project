ActiveAdmin.register Customer do

  
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :first_name, :last_name, :address, :city, :country, :postal_code, :email
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
  
  form do |f|
    f.inputs do
      f.input :first_name
      f.input :last_name
      f.input :address
      f.input :city
      f.input :country, as: :string
      f.input :postal_code
      f.input :email
    end
    f.actions
  end
end
