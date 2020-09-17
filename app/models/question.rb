# frozen_string_literal: true

# Question
class Question < ApplicationRecord
  has_many :answers
  has_and_belongs_to_many :templates

  include SoftDeletable
end
