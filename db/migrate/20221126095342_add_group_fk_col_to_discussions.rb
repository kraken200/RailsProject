class AddGroupFkColToDiscussions < ActiveRecord::Migration[7.0]
  def change
    add_reference :discussions, :group, foreign_key: true
  end
end
