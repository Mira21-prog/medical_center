ActiveAdmin.register Doctor do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :email, :password, :full_name, :phone_number, :password_confirmation, :category_id, :attachment
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :full_name, :phone_number]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  index do
    selectable_column
    id_column
    column :full_name
    column :email
    column :phone_number
    column :category
    actions
  end

  form do |f|
    f.inputs "Create doctor" do
      f.input :full_name
      f.input :email
      f.input :phone_number
      f.input :password
      f.input :password_confirmation
      f.input :attachment, as: :file
      f.input :category_id, :label => 'Category', :as => :select, :collection => Category.all.map{|u| [u.name, u.id]},include_blank: false
      f.submit
    end
  end

end
