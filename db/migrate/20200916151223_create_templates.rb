# frozen_string_literal: true

# create Templates model
class CreateTemplates < ActiveRecord::Migration[5.2]
  def change
    create_table :templates do |t|
      t.string :name
      t.text :content
      t.integer :version
      t.string :status

      t.timestamps
    end
  end
end
