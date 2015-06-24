class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :person_a
      t.integer :person_b
      t.integer :status, default: 0
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
