class CreateMonthlyPostsCounts < ActiveRecord::Migration[5.1]
  def change
    create_table :monthly_posts_counts do |t|
      t.integer :count
      t.string :month

      t.timestamps
    end
  end
end
