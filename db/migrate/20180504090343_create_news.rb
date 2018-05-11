class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :content 
      t.string :headline
      t.belongs_to :user, index: true
      
      t.timestamps null: false
    end
  end
end
