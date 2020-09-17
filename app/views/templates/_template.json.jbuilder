# frozen_string_literal: true

json.extract! template, :id, :name, :content, :version, :created_at, :updated_at
json.url template_url(template, format: :json)
