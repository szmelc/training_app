ActiveAdmin.register_page "Reports" do
  menu priority: 4
  # menu parent: 'Daily Post Reports'
  content do
    render 'chart'
  end
end
