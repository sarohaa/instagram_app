class Post < ActiveRecord::Base
	acts_as_votable
	 has_attached_file :image, styles: { xsmall: "50x50>",small: "100x100>", medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
