# frozen_string_literal: true

json.extract! document, :id, :status, :output, :created_at, :updated_at
json.url document_url(document, format: :json)
