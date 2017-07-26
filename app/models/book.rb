class Book < ApplicationRecord
  belongs_to :author

  scope :deleted, -> { where deleted: true }
  scope :not_deleted, -> { where deleted: false }

  enable_soft_destroy
end
