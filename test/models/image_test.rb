require 'test_helper'

class ImageTest < ActiveSupport::TestCase
# test "the truth" do
#   assert true
# end

	def setup
		@image = Image.new
	end

	test "link should not be blank" do 
		@image.link = ""
		assert_not @image.valid?
	end

	test "invalid link should be rejected" do
		invalid_links = %w{ wewerw www.asda.c asdada.12 }
		invalid_links.each do |invalid_link| 
			@image.link = invalid_link
			assert_not @image.valid?
		end
	end

	test "link should provide valid ext" do 
		invalid_exts = [ "http://www.gooogle.com/image.raw", "https://www.yahooo.com/imgae.gif"]
		invalid_exts.each do |invalid_ext|
			@image.link = invalid_ext 
			assert_not @image.valid?
		end
	end


end
