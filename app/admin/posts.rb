ActiveAdmin.register Post do
  menu priority: 2
  permit_params :user, :title, :content
end
