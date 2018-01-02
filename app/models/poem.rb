class Poem < ApplicationRecord
  def self.search_poems(query)
    return Poem.where("title || ' ' || lines || ' ' || source ILIKE ?", "%#{query}%")
  end
end
