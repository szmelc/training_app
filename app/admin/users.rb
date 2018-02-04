ActiveAdmin.register User do
  menu priority: 1
  permit_params do
    permitted = [
      :name,
      :bio,
      :title,
      :website,
      :phone_number,
      :admin
    ]
  end

  index do
    column :id
    column :name
    column :country
    column :title
    column :website
    column :phone_number
    column :posts_count
    column :admin
  end
end
