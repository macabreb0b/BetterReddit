class CreateLinkSubs < ActiveRecord::Migration
  def change
    create_table :link_subs do |t|
      t.references :link, index: true
      t.references :sub, index: true

      t.timestamps
    end
  end
end
