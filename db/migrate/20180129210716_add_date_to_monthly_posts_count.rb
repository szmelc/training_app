class AddDateToMonthlyPostsCount < ActiveRecord::Migration[5.1]
  def change
    add_column :monthly_posts_counts, :date, :date
  end
end
