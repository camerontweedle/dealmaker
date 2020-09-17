# frozen_string_literal: true

require 'test_helper'

class DocumentTest < ActiveSupport::TestCase
  setup do
    @question = Question.create({ label: 'test', content: 'what is this?' })
    @template = Template.create({ name: 'test', content: "this is a {{@#{@question.id}}}" })
    @document = Document.create({ template_id: @template.id, output: '' })
    @answer = Answer.create({ document_id: @document.id, question_id: @question.id, content: 'TEST' })
  end

  test 'should parse the output' do
    @document.output = nil
    @document.save
    assert_equal(@document.output, 'this is a TEST')
  end
end
