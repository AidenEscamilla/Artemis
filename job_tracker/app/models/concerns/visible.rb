module Visible
  extend ActiveSupport::Concern

  STATUSES = ['public', 'archived']

  included do
    validates :status, inclusion: { in: STATUSES }
  end

  class_methods do
    def public_count
      where(status: 'public').count
    end
  end

  def archived?
    status == 'archived'
  end
end
