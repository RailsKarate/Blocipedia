class FixColumnPrivate < ActiveRecord::Migration
  def change
  	rename_column :wikis, :private, :isprivate
  end
end
