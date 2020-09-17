# frozen_string_literal: true

require 'test_helper'

class DocumentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @document = documents(:one)
    @template = templates(:one)
    @question = questions(:one)
    @answer = answers(:one)
  end

  test 'should get index' do
    get template_documents_url(@template)
    assert_response :success
  end

  test 'should get new' do
    get new_template_document_url(@template)
    assert_response :success
  end

  test 'should create document' do
    assert_difference('Document.count') do
      post template_documents_url(@template), params: { document: {
        output: @document.output,
        status: @document.status,
        template_id: @template.id
      } }
    end

    assert_redirected_to template_document_url(@template, Document.last)
  end

  test 'should add answers' do
    assert_difference('Answer.count') do
      post template_documents_url(@template), params: { document: {
        output: @document.output,
        status: @document.status,
        template_id: @template.id,
        answers: { "#{@question.id}": 'test answer' }
      } }
    end
  end

  test 'should show document' do
    get template_document_url(@template, @document)
    assert_response :success
  end

  test 'should render pdf' do
    get template_document_url(@template, @document, 'pdf')
    assert_response :success
  end

  test 'should get edit' do
    get edit_template_document_url(@template, @document)
    assert_response :success
  end

  test 'should update document' do
    patch template_document_url(@template, @document), params: { document: {
      output: @document.output,
      status: @document.status,
      template_id: @template.id
    } }
    assert_redirected_to template_document_url(@template, @document)
  end

  test 'should destroy document' do
    delete template_document_url(@template, @document)

    assert_redirected_to template_documents_url
  end
end
