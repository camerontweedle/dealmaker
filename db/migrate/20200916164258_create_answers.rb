# frozen_string_literal: true

# create Answer model
class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.belongs_to :document
      t.belongs_to :question
      t.string :content

      t.timestamps
    end
  end
end
