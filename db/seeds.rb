# Cow
cow = Animal.find_or_create_by_name('Cow')

cow_primal_cuts = ['Chuck', 'Short Loin', 'Rib']
cow_cuts_of_rib = ['Prime Rib', 'Ribeye']
cow_cuts = ['Porterhouse', 'T-bone', 'Strip']

cow_primal_cuts.each do |pc|
  cow.primal_cuts.find_or_create_by_name(pc)
end

rib = cow.primal_cuts.find_by_name('Rib')
cow_cuts_of_rib.each do |rc|
  rib.cuts.find_or_create_by_name(rc)
end

cow_cuts.each do |cc|
  cow.cuts.find_or_create_by_name(cc)
end

# Pig
pig = Animal.find_or_create_by_name('Pig')

pig_primal_cuts = ['Jowl', 'Ham', 'Loin']
pig_cuts_of_loin = ['Loin Chop', 'Blade Roast']
pig_cuts = ['Babyback Ribs', 'Spareribs', 'Hock']

pig_primal_cuts.each do |pc|
  pig.primal_cuts.find_or_create_by_name(pc)
end

loin = pig.primal_cuts.find_by_name('Loin')
pig_cuts_of_loin.each do |lc|
  loin.cuts.find_or_create_by_name(lc)
end

pig_cuts.each do |pc|
  pig.cuts.find_or_create_by_name(pc)
end

# Users
jack = User.find_or_create_by_email( { first_name: 'Jack', last_name: 'Nicholson', email: 'jack.nicholson@truth.com'} )
judy = User.find_or_create_by_email( { first_name: 'Judy', last_name: 'Rush', email: 'judy@truth.com'})

# Favorites
nysteak = Favorite.find_or_create_by_name('New York Sirloin Steak')
sirloin_cut = Cut.find_or_create_by_name("Sirloin")
nysteak.cut = sirloin_cut
jack.favorites << nysteak

lasteak = Favorite.find_or_create_by_name('LA Summer Steak')
stew_cut = Cut.find_or_create_by_name("Stew")
lasteak.cut = stew_cut
judy.favorites << lasteak

dinner_at_outback = Favorite.find_or_create_by_name("Dinner at Outback")
hock_cut = Cut.find_or_create_by_name("Hock")
dinner_at_outback.cut = hock_cut
judy.favorites << dinner_at_outback
