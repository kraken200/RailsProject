class RenameTypeColumnToMemberType < ActiveRecord::Migration[7.0]
  def self.up
    rename_column :groups, :type, :member_type
  end

  def self.down
    rename_column :groups, :member_type, :type
  end
end
