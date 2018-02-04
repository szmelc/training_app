ActiveAdmin.register Post do
  menu priority: 2
  permit_params :user, :title, :content
  index do
    column :id
    column :title
    column :content
    column :user
    column :comments_count
    column :created_at
    actions
  end
end
