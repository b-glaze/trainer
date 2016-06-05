class AddAttachmentConfirmToEvents < ActiveRecord::Migration
  def self.up
    change_table :events do |t|
      t.attachment :confirm
    end
  end

  def self.down
    remove_attachment :events, :confirm
  end
end
