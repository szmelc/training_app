ActiveAdmin.register DailyPostsCount, as: 'Daily Post Reports' do
  menu false
  menu parent: 'Reports'
  actions :all, except: [:update, :destroy, :create, :new]
  index do
    column :id
    column 'Amount of Posts', :count
    column :date
  end
end
