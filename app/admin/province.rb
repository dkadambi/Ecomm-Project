ActiveAdmin.register Province do

  
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :name, :pst, :gst, :hst
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
        f.input :pst, :input_html => {value: number_with_precision(f.object.pst, precision: 5) }
        f.input :gst, :input_html => {value: number_with_precision(f.object.gst, precision: 5) }
        f.input :hst, :input_html => {value: number_with_precision(f.object.hst, precision: 5) }
      end
       f.actions  
  end
end
