class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user, index: true
      t.integer :parent_comment_id
      t.references :link, index: true
      t.string :body

      t.timestamps
    end
  end
end
