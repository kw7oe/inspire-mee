## Introduction
Cloning web applications is one of the way to improve one web deveploment skills. I have always think that the layout in Pinterest is cool. So, I decided to create a simple web application that shared the similar features, called [Inspire-Mee](https://inspiremee.herokuapp.com). In this single page application, visitor is able to add images/artworks that will bring inspiration to others.

## Use Cases
1. Visitor is able to add new image by inserting the url (ending with either, jpeg or png).
2. Visitor is able to rate the images as inspiring.
3. Visitor is able to sort the gallery by date or inspired count.

## Primary Features
* Masonry Layout (Like [Pinterest](http://www.pinterest.com))
* AJAX 
* Sorting based on Date or Inspired Count

## Limitation

* No image moderation is carried out. User is able to share adult contents.
* URL provided must end with either JPEG, JPG, PNG extension. The image link is validated in code as below:
```
validates :link, format: { with: /(jpg|jpeg|png|JPG|PNG|JPEG)\Z/,
			   message: "must be contained PNG/JPG extension." }
```
* Since, there is no user login required, this application track visitors by cookies to find out visitors' activities. E.g. whether the visitor has rate the image before. Below are how the inspired count is tracked:
```
def inspired
	@image.increase_count

	# Track if the visitor has upvoted the image. Not suitable if the application
	# grow larger. Since the session is stored in Cookies Store, which has limited 
	# storage of 4KB. 
	session[@image.id] = true

	respond_to do |format| 
		format.html { redirect_to @image }
		format.js
	end
end
```
* There is a visual bug during the pop up modal when a visitor click "Add Image" in Safari.

## Resources

* [Masonry](http://masonry.desandro.com)
	* Thanks to this [StackOverflow questions](http://stackoverflow.com/questions/8470070/how-to-create-grid-tile-view-with-css), I discovered this library.




