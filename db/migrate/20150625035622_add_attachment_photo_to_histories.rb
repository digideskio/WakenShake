class AddAttachmentPhotoToHistories < ActiveRecord::Migration
  def self.up
    change_table :histories do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :histories, :photo
  end
end
