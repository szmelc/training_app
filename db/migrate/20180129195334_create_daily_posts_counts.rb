class CreateDailyPostsCounts < ActiveRecord::Migration[5.1]
  def change
    create_table :daily_posts_counts do |t|
      t.date :date
      t.integer :count

      t.timestamps
    end
  end
end
