class Image < ActiveRecord::Base
	default_scope -> { order(id: :desc) }
	VALID_URL_REGEX = URI.regexp
	validates :link, presence: true,
					 format: { with: VALID_URL_REGEX }
	validates :link, format: { with: /(jpg|png)\Z/ }
end
