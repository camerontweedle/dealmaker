# frozen_string_literal: true

# create Document model
class CreateDocuments < ActiveRecord::Migration[5.2]
  def change
    create_table :documents do |t|
      t.belongs_to :template
      t.text :output
      t.string :status

      t.timestamps
    end
  end
end
