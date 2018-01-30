ActiveAdmin.register Post do
  menu parent: "Users"
  menu priority: 2
  permit_params :user, :title, :content
  show do
    render 'chart'
  end
end
