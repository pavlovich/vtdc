class AddDefaultUser < ActiveRecord::Migration
  def self.up
    peter = User.new
    peter.name="Peter Pavlovich"
    peter.email_address="pavlovich@gmail.com"
    peter.state="active"
    peter.password="Pupshine0223"
    peter.password_confirmation="Pupshine0223"
    peter.administrator=true
    peter.save
  end

  def self.down
    peter.find_by_email("pavlovich@gmail.com")
    peter.delete
  end
end
