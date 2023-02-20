class CreateDiscussions < ActiveRecord::Migration[7.0]
  def change
    create_table :discussions do |t|
      t.string :content
      t.integer :uid

      t.timestamps
    end
  end
end
