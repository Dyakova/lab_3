class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :name
      t.string :language
      t.string :state
      t.timestamps
    end
  end
end
