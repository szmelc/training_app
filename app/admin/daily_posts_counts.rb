ActiveAdmin.register DailyPostsCount, as: 'Daily Post Reports' do
  menu priority: 3
  actions :all, except: [:update, :destroy, :create, :new]
  index do
    column :id
    column 'Amount of Posts', :count
    column :date
    div class: "panel" do
      h3 "Posts overall: #{collection.pluck(:count).reduce(:+)}"
    end
  end

end
