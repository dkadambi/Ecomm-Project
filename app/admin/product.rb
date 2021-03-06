ActiveAdmin.register Product do
  
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :name, :price, :stock_quantity, :image, :description, :category_id, :delete_image, :status
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
  
  

  form :html => { :enctype => "multipart/form-data" } do |f|
   f.inputs "Details" do
    f.input :name
    f.input :description
    f.input :price
    f.input :stock_quantity
    f.input :category_id, :as => :select, :collection => Category.all
    f.input :status
    f.input :image, :as => :file, :hint => f.template.image_tag(f.object.image.url(:medium))
    f.input :delete_image, as: :boolean, required: :false, label: 'Remove Image'
  end
  f.actions
 end
end
