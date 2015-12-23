class Painting < ActiveRecord::Base
  belongs_to :artist
  belongs_to :museum

  def self.search(input)
    self.where("title LIKE :input or year LIKE :input or style LIKE :input", input: "%#{input}%")
  end
end
