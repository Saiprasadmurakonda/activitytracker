class CreateIndividuals < ActiveRecord::Migration[7.1]
  def change
    create_table :individuals do |t|
      t.string :website
      t.datetime :last_in
      t.datetime :last_out
      t.string :time_spent

      t.timestamps
    end
  end
end
