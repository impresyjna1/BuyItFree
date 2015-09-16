class Customer < ActiveRecord::Base
    belongs_to :user
  
    VALID_POST_CODE_REGEX = /\d{2}-\d{3}\z/
    VALID_WORD_REGEX = /\A\D+\z/
    validates :post_code, presence: true, format: { with: VALID_POST_CODE_REGEX }
    validates :city, presence: true, format: {with: VALID_WORD_REGEX }, length: { maximum: 50 }
    validates :name, presence: true, format: {with: VALID_WORD_REGEX }, length: { maximum: 50 }
    validates :surname, presence: true, format: {with: VALID_WORD_REGEX }, length: { maximum: 50 }
    validates :address, presence: true, length: { maximum: 100 }
    validates :telephone, numericality: true, length: { :minimum => 7, :maximum => 15 }
    
  
end
