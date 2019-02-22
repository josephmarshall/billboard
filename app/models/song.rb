class Song < ApplicationRecord
  belongs_to :artist
  belongs_to :musicboard, optional: true
end
