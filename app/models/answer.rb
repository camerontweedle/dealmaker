# frozen_string_literal: true

# Answer
class Answer < ApplicationRecord
  has_one :question
  has_one :document
end
