class RenameMonthlyPostCountsTable < ActiveRecord::Migration[5.1]
  def change
    rename_table :monthraily_posts_counts, :monthly_posts_counts
  end
end
