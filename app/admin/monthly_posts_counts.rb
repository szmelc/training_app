ActiveAdmin.register MonthlyPostsCount, as: 'Monthly Post Reports' do
  menu false
  menu parent: 'Reports'
  actions :all, except: [:update, :destroy, :create, :new]
  index do
    column :id
    column 'Amount of Posts', :count
    column :month
    column :date
  end
end
