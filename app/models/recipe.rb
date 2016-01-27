class Recipe < ActiveRecord::Base
	mount_uploader :image, ImageUploader
	has_many :directions 
	has_many :ingredients
	belongs_to :user
	validates :title, :description, presence: true
	accepts_nested_attributes_for :ingredients, reject_if: :all_blank, allow_destroy: true
	accepts_nested_attributes_for :directions, reject_if: :all_blank, allow_destroy: true
end
