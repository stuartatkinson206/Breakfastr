class Pastry < ActiveRecord::Base
	belongs_to :user
	has_many :orders
# github.com/thoughtbot/paperclip
	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

	validates :name, presence:true, uniqueness: true
	validates :price_in_pence, numericality:{greater_than_or_equal_to: 50}
end
