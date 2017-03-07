# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

image_links = [
  "http://handluggageonly.co.uk/wp-content/uploads/2015/08/Photography-Inspiration-8-Beautiful-Portrait-Photos-And-The-Reasons-Why-Theyre-Brilliant-005.jpg", 
  "https://s-media-cache-ak0.pinimg.com/564x/e5/12/e3/e512e32d1e40bb992589b6b183e54f64.jpg", "http://www.92pixels.com/wp-content/uploads/2011/01/Logo-Design-Inspiration66.jpg", 
  "http://www.architecturalrecord.com/ext/resources/Issues/2016/May/1605-Architecture-Creativity-Zaha-Hadid-01.jpg", 
  "https://www.w3schools.com/css/img_lights.jpg", 
  "https://upload.wikimedia.org/wikipedia/commons/b/b8/STmaximin-Solitude.jpg", 
  "http://mymodernmet.com/wp/wp-content/uploads/archive/J-WwyVe7B6zjhdFJ00MR_1082106464.jpeg", 
  "http://keenthemes.com/preview/metronic/theme/assets/global/plugins/jcrop/demos/demo_files/image1.jpg"
]

image_links.each do |link|
  Image.create(link: link)
end