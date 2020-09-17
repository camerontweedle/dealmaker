# frozen_string_literal: true

require 'test_helper'

class SoftDeletableTest < ActiveSupport::TestCase
  softdeletable = Template.create

  test 'updates the status on delete' do
    softdeletable.delete
    assert_equal softdeletable.status, 'deleted'
  end
end
