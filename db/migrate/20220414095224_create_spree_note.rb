class CreateSpreeNote < ActiveRecord::Migration[6.0]
  def change
    create_table :spree_notes do |t|
      t.text :note
      t.references :user
      t.references :notable, polymorphic: true

      t.timestamps
    end
  end
end
