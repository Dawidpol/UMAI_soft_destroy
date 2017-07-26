class Author < ApplicationRecord
  has_many :book, dependent: :destroy

  scope :deleted, -> { where deleted: true }
  scope :not_deleted, -> { where deleted: false }

  enable_soft_destroy
end
