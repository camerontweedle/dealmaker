# frozen_string_literal: true

# Abstract
class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  scope :include_nil, -> { where(status: nil) }
  scope :not_deleted, -> { where.not(status: 'deleted') }
end
