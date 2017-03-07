class Song < ActiveRecord::Base
##<Song title: "Talisman", released: false, release_year: nil,
 # artist_name: "Air", genre: "Post-Rock">
  validates :title , presence: true
  validates :released, inclusion: { in: [true, false] }
  validates :release_year, presence: true, if: :released?
  # validates :title, uniqueness: {
  #   scope: [:release_year, :artist_name],
  #   message: "cannot be repeated by the same artist in the same year"
  # }
  validates :artist_name, uniqueness: true, if: :compare_title_against_all_title?
  validates :release_year, :numericality => { :less_than_or_equal_to => Time.now.year }
 #
  def released?
    binding.pry
    self.released
  end

  def compare_title_against_all_title?

    Song.all.each do |song|

      return true if (song.release_year == release_year) && (song.title == title)
    end
    return false
  end

  # validates :release_year, uniqueness: { case_sensitive: false }

end
