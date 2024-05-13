class CreateBlockeds < ActiveRecord::Migration[7.1]
  def change
    create_table :blockeds do |t|
      t.string :blocked_site

      t.timestamps
    end
  end
end
