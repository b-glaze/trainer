class Event < ActiveRecord::Base
	has_attached_file :cover, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :cover, content_type: /\Aimage\/.*\Z/
	has_attached_file :confirm, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :confirm, content_type: /\Aimage\/.*\Z/

	validates :title, presence: true
	validates :description, presence: true
	validates :price, presence: true, :inclusion => { :in => 1..800, :message => " must be between $1 and $800"}
	validates_presence_of :cover_file_name, :message => "Please add cover and confirmation photos at the same time."
	validates_presence_of :confirm_file_name, :message => "Please add cover and confirmation photos at the same time."

end
