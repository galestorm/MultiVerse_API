class User < ApplicationRecord
  has_many :saved_poems, dependent: :destroy
  has_many :experiences, dependent: :destroy
end
