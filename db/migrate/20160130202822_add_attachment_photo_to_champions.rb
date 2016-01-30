class AddAttachmentPhotoToChampions < ActiveRecord::Migration
  def self.up
    change_table :champions do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :champions, :photo
  end
end
