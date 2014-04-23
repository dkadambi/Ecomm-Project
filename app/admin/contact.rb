ActiveAdmin.register Contact do

  
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :title, :street_address, :city, :province, :country, :phone, :email, :additional_information
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
    f.input :title
    f.input :street_address
    f.input :city
    f.input :province
    f.input :country, as: :string
    f.input :phone
    f.input :email
    f.input :additional_information, as: :text
  end

  f.actions
end
  
end
