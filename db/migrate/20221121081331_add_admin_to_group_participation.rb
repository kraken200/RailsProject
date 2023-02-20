class AddAdminToGroupParticipation < ActiveRecord::Migration[7.0]
  def change
    add_column :group_participations, :admin, :string
  end
end
