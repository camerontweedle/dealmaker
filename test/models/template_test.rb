# frozen_string_literal: true

require 'test_helper'

class TemplateTest < ActiveSupport::TestCase
  setup do
    @question = Question.create({ label: 'test', content: 'what is this?' })
    @template = Template.create({ name: 'test', content: "this is a {{@#{@question.id}}}" })
    @document = Document.create({ template_id: @template.id, output: '' })
    @answer = Answer.create({ document_id: @document.id, question_id: @question.id, content: 'TEST' })
  end

  test 'should bump version' do
    old_version = @template.version

    assert_difference('Template.count') do
      @template.name = 'test2'
      @template.save
    end

    assert_not_equal(@template.version, old_version)
  end
end
