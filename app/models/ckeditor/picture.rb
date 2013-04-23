class Ckeditor::Picture < Ckeditor::Asset



  has_attached_file :data,
                    :url  => "photos.totaldoberman.com",
                    :path => "ckeditor_assets/pictures/:id/:style_:basename.:extension",
                    :styles => {
                        :thumb=> "100x100#",
                        :content => "300x300>",
                        :slide => "540x420" }

  validates_attachment_size :data, :less_than => 2.megabytes
  validates_attachment_presence :data

  def url_content
    url(:content)
  end
end
