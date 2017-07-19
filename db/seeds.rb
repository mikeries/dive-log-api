# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
guest = User.new({name: "Guest", email: "guest"})

santa_rosa_wall = guest.locations.build({
  name: "Santa Rosa Wall",
  city: "Cozumel",
  country: "Mexico",
  category: "Wall",
  description: <<-DESC
Santa Rosa Wall is one of the most popular deep dive sites. The wall 
begins at around 15 meters and extends deeper into the blue Caribbean 
abyss. Santa Rosa Wall has so much to offer divers including, enormous 
sponges, caves, swim-through tunnels, and overhangs of stony coral. 
If you are looking for stunning marine life, sea turtles, eagle rays, 
and large grouper have been seen there on a regular basis. This dive site 
is more for intermediate level divers, as the currents can be strong.
  DESC
})


columbia_wall = guest.locations.build({
  name: "Colombia Wall",
  city: "Cozumel",
  country: "Mexico",
  category: "Wall",
  description: <<-DESC
Colombia wall is over 30 meters high and is home to a stunning cave, 
tunnel and cavern systems. When diving at this site, you can expect 
to see giant coral pillars, some of which tower over 20 meters tall. 
Large barracuda are often seen here within the surrounding Caribbean waters, 
as well as large sea turtles, eagle rays, and beautiful reef fish. Keep 
your eyes open for the Blue Tang, also known as surgeon-fish, with their 
scalpel-sharp tail appendages. If you are a budding photographer, the shallows 
of this site are perfect for capturing stunning images. This site is definitely 
not to be missed if you’re planning a trip to Cozumel.
  DESC
})

molokini = guest.locations.build({
  name: "Black Wall of Molokini",
  city: "Maui, Hawaii",
  country: "United States",
  category: "Wall",
  description: <<-DESC
There is often only a slight current here, though it is mainly for 
intermediate to advanced divers because its unique ledges and walls drop 
down to over 200 feet. The wall and ledge formation also makes this spot a 
drift dive. The incredible depths mean that there is typically more than 100 
feet of visibility! This is the perfect spot to see wildlife, including sharks, 
whales, dolphins, manta rays, and many other rare fish.
  DESC
})

cathedrals = guest.locations.build({
  name: "The Cathedrals",
  city: "Lanai, Hawaii",
  country: "United States",
  category: "Reef",
  description: <<-DESC
Diving depth is sixty to seventy feet, and visibility is typically 100 feet 
or more. Beginner through advanced divers can enjoy this spot! It is the most 
popular dive site off the island of Lanai. The dual pinnacles of Cathedrals 
sets up great wall diving, as well as dramatic arches and caves. The caverns 
have ceiling heights up to twenty feet, laced with lava rock, which lets in 
pockets of light, much like a stained glass window.
  DESC
})

challenger_bay = guest.locations.build({
  name: "Challenger Bay, Ribbon Reefs",
  city: "Great Barrier Reef",
  country: "Australia",
  category: "Reef",
  description: <<-DESC
Plentiful trevally and surgeonfish and other schooling species congregate 
over these shallow, hard-coral gardens in the Ribbon Reefs, which also offer 
stellar night diving with plentiful nocturnal activity.
  DESC
})

tortuga_island = guest.locations.build({
  name: "Tortuga Island",
  city: "Isabela Island",
  country: "Galapogos, Ecuador",
  category: "Drift/Wall",
  description: <<-DESC
This Galapagos dive site, located off of Isabela Island, is great for 
intermediate level divers who aren’t afraid of following a deep drift wall 
down to the depths of 40 meters, or 131 feet. Here, you will find a variety of 
native species, including Galapagos sharks, Galapagos sheep head, and Galapagos 
Groupers, as well as many Mantas, Stingrays, Sunfish, and more. You may even 
get the chance to see Hammerhead sharks and White-tipped reef sharks. But if 
you’re truly lucky, you may be diving at the right place at the right time to 
see a passing Orca.
  DESC
})

blue_hole = guest.locations.build({
  name: "Blue Hole, Lighthouse Reef",
  city: "Ambergris Cay",
  country: "Belize",
  category: "Wall",
  description: <<-DESC
Once an above ground cave that has collapsed this spectacular deep blue circle 
is 1,000 feet in diameter and over 400 feet deep. The Blue Hole is located at 
Lighthouse Reef, which is one of Belize’s three coral atolls. Visibility when 
first entering the water is not that great and the water has a gray color to 
it but once you have descended past the thermocline at 50 or 60 ft the water 
clarity will improve dramatically. This dive is not about the fish and coral 
formations you are used to seeing it is the stalactites you are going to see. 
Once you reach the 100 ft mark you will entire the first under cut where you 
begin swimming between these formations. Even though the water is clear light 
is limited so for the best experience bring a dive light, this will help you 
spot the invertebrates and sponges that live here.
  DESC
})

aquarium = guest.locations.build({
  name: "The Aquarium, Lighthouse Reef",
  city: "Long Caye",
  country: "Belize",
  category: "Reef",
  description: <<-DESC
This site gets its name from the great variety of small reef fish that call 
this reef top and wall edge home. You can find both a well-developed spur and 
groove reef formation that leads to a wall. The fish here make very cooperative 
subjects for any photographer. At about 60 ft you will start to find the azure 
vase sponges and large barrel sponges starting to appear. Be sure to check for 
juvenile reef fish and the banded coral shrimp that like to take shelter here. 
On the top of the wall look between the large gorgonians for trumpet fish and 
black groupers while turtles and French angelfish can be found on the reef crest. 
As you swim along the wall be sure to keep a look out in the blue water for sharks, 
manta rays and other large fish.
  DESC
})

guest.dives.build({
  comments: "My first time in Belize.  Loved it!", 
  location: aquarium, 
  date: "2/10/2013",
  time: "10:03",
  ballast: 8,
  duration: 66,
  max_depth: 40,
  starting_pressure: 3000,
  final_pressure: 743
})

guest.dives.build({
  comments: "I was nervious about the depth, so I took it easy.", 
  location: blue_hole, 
  date: "2/12/2013",
  time: "7:00",
  ballast: 8,
  duration: 57,
  max_depth: 100,
  starting_pressure: 3130,
  final_pressure: 621
})

guest.dives.build({
  comments: "Had some problems with my ears.  Perfect visibility.  Saw several turtles and a shark.",
  location: molokini, 
  date: "6/6/2014",
  time: "11:30",
  ballast: 8,
  duration: 54,
  max_depth: 59,
  starting_pressure: 3130,
  final_pressure: 743
})

guest.save