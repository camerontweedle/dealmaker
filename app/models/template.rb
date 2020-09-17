# frozen_string_literal: true

# Template
class Template < ApplicationRecord
  has_many :documents
  has_and_belongs_to_many :questions
  before_save :version_bump

  include SoftDeletable

  private

  def version_bump
    self.version = 1 if version.nil?
    return unless documents.count.positive?

    self.version += 1
    clone_current unless id.nil?
  end

  def clone_current
    t = Template.new(Template.find(id).attributes.except('id'))
    t.version = version - 1
    t.documents = documents
    t.questions = questions
    self.documents = []
    t.save
  end
end
