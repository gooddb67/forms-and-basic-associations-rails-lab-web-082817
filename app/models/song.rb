class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

attr_reader

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    if self.artist == nil
      nil
    else
      self.artist.name
    end
  end

  def genre_name
    self.genre.name
  end

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def note_contents=(content)
    content.each do |content|
      note = Note.create(content: content)
      self.notes << note
    end
  end

  def note_contents
    self.notes.map do |note|
      note.content
    end.reject{|e| e.empty?}
  end

end
