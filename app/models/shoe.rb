class Shoe < ActiveRecord::Base
  belongs_to :user

  #validations#
  validates :name, presence: true, length: { in: 2..30 }
  validates :cost, presence: true, numericality: { greater_than: 0 }


end
