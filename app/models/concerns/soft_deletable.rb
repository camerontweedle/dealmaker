# frozen_string_literal: true

# Intercepts ActiveRecord delete
module SoftDeletable
  extend ActiveSupport::Concern

  def delete
    update_column :status, 'deleted' if has_attribute? :status
  end

  def destroy
    callbacks_result = transaction do
      run_callbacks(:destroy) do
        delete
      end
    end
    callbacks_result ? self : false
  end
end
