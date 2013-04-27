class Photo < ActiveRecord::Base

  hobo_model # Don't put anything above this

  RedactorRails.picture_model=Photo

  fields do
    name              :string
    caption           :string
    publicly_visible  :boolean, :default => true
    slideshow         :boolean, :default => false
    tags              :string, :default => 'None'
    timestamps
  end
  attr_accessible :name, :caption, :tags, :publicly_visible, :slideshow, :data

  has_attached_file :data,
                    :url  => "photos.totaldoberman.com",
                    :path => "pictures/:id/:style_:basename.:extension",
                    :styles => {
                        :thumb=> "100x100#",
                        :slide => "540x420" }

  validates_attachment_size :data, :less_than => 2.megabytes
  validates_attachment_presence :data

  def self.with_tag(tag_string)
    Photo.where("photos.tags ~= ?", tag_string)
  end

  def self.for_slideshow
    Photo.where(:slideshow => true)
  end

  def thumb
    strip_CSRF(data.url(:thumb))
  end

  def original
    url
  end

  def image
    url
  end

  def slide
    strip_CSRF(data.url(:slide))
  end

  def title
    name
  end

  def folder
    tags || "default"
  end

  def url
    strip_CSRF(data.url(:original))
  end

  def as_json(options)
    {thumb: thumb, image: image, title: title, folder: folder, url: url, name: name, caption: caption, tags: tags}
  end


  # --- Permissions --- #

  def create_permitted?
    acting_user.logged_in?
  end

  def update_permitted?
    acting_user.logged_in?
  end

  def destroy_permitted?
    acting_user.logged_in?
  end

  def view_permitted?(field)
    publicly_visible || acting_user.logged_in?
  end

  def strip_CSRF(the_url)
    the_url.partition('?').first
  end

end
