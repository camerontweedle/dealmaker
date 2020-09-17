# frozen_string_literal: true

# Document
class Document < ApplicationRecord
  has_many :answers
  has_one :template
  after_save :parse_output

  validates :template_id, presence: true

  include SoftDeletable

  private

  def parse_output
    return unless output.nil?

    content = Template.find(template_id).content
    _first, *rest = content.split('{{@')
    q_ids = extract_q_ids(rest)

    q_ids.map do |match, id|
      content.gsub!(match, Answer.where(document_id: self.id, question_id: id).first.content)
    end

    self.output = content
    save
  end

  def extract_q_ids(data)
    data.map do |s|
      ["{{@#{s.split('}}')[0]}}}", s.split('}}')[0]]
    end
  end
end
