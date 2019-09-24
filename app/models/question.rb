class Question < ApplicationRecord
  has_many :answers, dependent: :destroy, inverse_of: :question
end
