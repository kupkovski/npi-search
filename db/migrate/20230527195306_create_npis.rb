class CreateNpis < ActiveRecord::Migration[7.0]
  def change
    create_table :npis do |t|
      t.string :number
      t.integer :enumeration_type

      t.string  :taxonomy_code
      t.string  :taxonomy_group
      t.string  :taxonomy_description
      t.string  :taxonomy_state
      t.string  :taxonomy_license
      t.boolean :taxonomy_primary

      t.string :first_name
      t.string :last_name
      t.string :gender

      t.string :country
      t.string :address_1
      t.string :city
      t.string :state
      t.string :postal_code

      t.timestamps
    end
  end
end

