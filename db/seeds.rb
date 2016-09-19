electornics = Category.create({
  name: 'Electronics'
})

electornics.items.create({
  title: 'Microphones',
  description: 'A pair of Sennheiser mics. You'll be sure to be heard with these. Use with just three easy steps: 1) Say something clever. 2) Drop mic. 3) Walk away.',
  price: 2.00,
  image: 'http://i.imgur.com/oKOO17Z.jpg'
})

electornics.items.create({
  title: 'Headphones (cream color)',
  description: 'A pair of cream headphones. Used to listen to music, or just to wear without sound to indicate that you don't want those around you to be speaking to you.',
  price: 89.00,
  image: 'http://i.imgur.com/R9EtDEo.jpg'
})

electornics.items.create({
  title: 'MacBook Charging Converter (certified pre-owned)',
  description: 'This can be used to charge some Apple computers. That is, until Apple gets a wild hair and decides to change the model so it won't fit anymore. Their standards usually last a year or two. It's expensive, because otherwise how will you show it off as a status symbol?',
  price: 1999.99,
  image: 'http://i.imgur.com/Mtre4Qv.jpg'
})

electornics.items.create({
  title: 'HDMI Cable',
  description: 'Used to put the contents of your computer screen on to a television.',
  price: 0.77,
  image: 'http://i.imgur.com/ayBljXj.jpg'
})

electornics.items.create({
  title: 'Sal's Keyboard',
  description: 'This oddly colored keyboard is guaranteed to make you run faster and jump higher.',
  price: 19.84,
  image: 'http://i.imgur.com/hC5S0kk.jpg'
})

stations = Category.create({
  name: 'Stations'
})

stations.items.create({
  title: 'Pairing Station',
  description: 'Now you and your buddy can both work on the same code!',
  price: 7,
  image: 'http://i.imgur.com/PXHoES9.jpg'
})

stations.items.create({
  title: 'Napping Station',
  description: 'You've been working hard. Take a load off.',
  price: 77.77,
  image: 'http://i.imgur.com/Vq6DDhJ.jpg'
})

animals = Category.create({
  name: 'Animals'
})

animals.items.create({
  title: 'Clarance, the Cunning Capybara',
  description: 'The capybara (Hydrochoerus hydrochaeris) is a large rodent of the genus Hydrochoerus of which the only other extant member is the lesser capybara (Hydrochoerus isthmius). The capybara is the largest rodent in the world. Close relatives are guinea pigs and rock cavies, and it is more distantly related to the agouti, chinchillas, and the coypu. Native to South America, the capybara inhabits savannas and dense forests and lives near bodies of water. It is a highly social species and can be found in groups as large as 100 individuals, but usually lives in groups of 10–20 individuals. The capybara is not a threatened species and is hunted for its meat and hide and also for a grease from its thick fatty skin which is used in the pharmaceutical trade.',
  price: 6.95,
  image: 'http://i.imgur.com/n0nUXR2.jpg'
})

miscellany = Category.create({
  name: 'Miscellany'
})

miscellany.items.create({
  title: 'Coffee Carafe',
  description: 'while(:alive == true) { eat(); coffee(); code() }',
  price: 19.84,
  image: 'http://i.imgur.com/mpdnEe0.jpg'
})

miscellany.items.create({
  title: 'Some Hockey Player',
  description: 'Probably like Wayne Gretzky or something. I dunno, I'm American. Ask a Canadian.',
  price: 0.84,
  image: 'http://i.imgur.com/jDr1tLn.jpg'
})

miscellany.items.create({
  title: 'Old Shoes from the Back Stairwell',
  description: 'These previously rocked beauties have been hanging around under the stars for a fortnight or two. Guaranteed to be broken in for you already. Jeff said to throw away anything worth less than twenty bucks, but these don't fit that criterion',
  price: 20.01,
  image: 'http://i.imgur.com/FZbrdyi.jpg'
})
