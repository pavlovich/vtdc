class Document < ActiveRecord::Base

  hobo_model # Don't put anything above this

  RedactorRails.document_model=Document

  fields do
    name :string
    timestamps
  end
  attr_accessible :name, :data

  has_attached_file :data,
                    :path => "attachments/:id/:filename"

  validates_attachment_size :data, :less_than => 100.megabytes
  validates_attachment_presence :data

  # --- Permissions --- #

  def create_permitted?
    acting_user.administrator?
  end

  def update_permitted?
    acting_user.administrator?
  end

  def destroy_permitted?
    acting_user.administrator?
  end

  def view_permitted?(field)
    true
  end

end
