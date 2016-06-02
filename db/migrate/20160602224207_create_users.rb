class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :user
      t.string :email
      t.references :competition, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
