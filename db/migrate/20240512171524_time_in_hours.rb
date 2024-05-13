class TimeInHours < ActiveRecord::Migration[7.1]
  def change
     rename_column :timeds, :timeinmin, :Time_in_Hours
  end
end

