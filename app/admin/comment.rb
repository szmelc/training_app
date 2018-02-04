ActiveAdmin.register Comment, as: 'Post Comments' do
  menu parent: 'Posts'
  permit_params :content, :user, :post
end
