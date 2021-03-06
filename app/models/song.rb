
require 'pry'
class Song < ActiveRecord::Base
  validates :title, :artist_name, presence: true
  validates :title, uniqueness: { scope: [:release_year, :artist_name],
      message: "Cannot be repeated by the same artist in the same year"}

  validates :released, inclusion: { in: [true, false],
      message: "Should be boolean"}

  #  validates :release_year, presence: false, if: :released?
  #  validates :release_year, :numericality => { :less_than_or_equal_to => Time.now.year }

  with_options if: :released? do |song|
      song.validates :release_year, presence: true
      song.validates :release_year, numericality: {
      less_than_or_equal_to: Date.today.year
    }
  end

  def released?
  released
  end

end
