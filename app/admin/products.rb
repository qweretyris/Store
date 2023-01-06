ActiveAdmin.register Product do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :price, :category_id, :description, :image

  form do |f|
    f.semantic_errors *f.object.errors.attribute_names
    f.inputs do
    f.input :image, as: :file
    f.input :category_id, label: "Category", as: :select, collection: Category.all
    f.input :name, label: "Name"
    f.input :price, label: "Price"
    f.input :description, label: "Description"
    end
    f.actions
  end

  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :price, :category_id, :description]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
