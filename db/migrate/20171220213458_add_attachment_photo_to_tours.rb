class AddAttachmentPhotoToTours < ActiveRecord::Migration[5.1]
  def self.up
    change_table :tours do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :tours, :photo
  end
end
