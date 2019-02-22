class Musicboard < ApplicationRecord
  has_many :songs#, through: :artist
end
