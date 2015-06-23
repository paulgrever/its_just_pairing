class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :uid
      t.string :login
      t.string :avatar_url
      t.string :html_url
      t.string :description
      t.timestamps null: false
    end
  end
end
