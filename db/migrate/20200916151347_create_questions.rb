# frozen_string_literal: true

# create Question model
class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :label
      t.text :content
      t.string :status

      t.timestamps
    end

    create_table :questions_templates do |t|
      t.belongs_to :template
      t.belongs_to :question
    end
  end
end
