class CreateSubs < ActiveRecord::Migration
  def change
    create_table :subs do |t|
      t.string :name
      t.references :user, index: true

      t.timestamps
    end
  end
end
