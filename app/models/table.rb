class Table < ApplicationRecord
  belongs_to :parameter
  belongs_to :animal

  validates :animal2_id, presence: true, allow_blank: true
end