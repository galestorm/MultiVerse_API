class Poem < ApplicationRecord
  has_many :saved_poems, dependent: :destroy
  has_many :experiences, dependent: :destroy
  def self.search_poems(query)
    return Poem.where("title || ' ' || lines || ' ' || source ILIKE ?", "%#{query}%")
  end
end
