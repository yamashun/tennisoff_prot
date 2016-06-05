class CreateAreas < ActiveRecord::Migration
  def change
    create_table :areas do |t|
      t.string :postal_code,        null: false
      t.references :prefectural,    index: true
      t.string :city,               default: ""
      t.string :street,             default: ""

    end
  end
end
