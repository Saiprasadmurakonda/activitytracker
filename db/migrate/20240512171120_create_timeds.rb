class CreateTimeds < ActiveRecord::Migration[7.1]
  def change
    create_table :timeds do |t|
      t.string :timed_site
      t.time :timeinmin

      t.timestamps
    end
  end
end
