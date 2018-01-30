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
end
