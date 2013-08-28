class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.belongs_to :user
      t.string :url
      t.string :short_url
      t.integer :visited
    end
  end
end
