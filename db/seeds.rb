# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
if Category.count == 0
  position = 1
  {'baby & kinder' => 'baby- & kinderspullen, kleding, speelgoed',
   'beeld & geluid' => 'beeld- & geluidsapparatuur, cd\'s, dvd\'s',
   'boeken' => 'boeken',
   'computers & accessoires' => 'computers & accessoires',
   'dieren & toebehoren' => 'dieren & toebehoren',
   'gereedschap' => 'gereedschap voor hout, metaal etc.',
   'kleding & accessoires' => 'kleding & mode-accessoires',
   'koken & keuken' => 'kookgerei & keukenspullen',
   'meubels & huisraad' => 'meubels & huisraad',
   'reizen & kamperen' => 'reizen & kamperen',
   'sport & fitness' => 'sport & fitness',
   'tuin & terras' => 'tuin & terras',
   'vervoer' => 'vervoersmiddelen (fiets, auto, boot, etc.)',
   'zaai- & pootgoed' => 'zaden, stekjes, planten, kruiden',
   'overig' => 'overige spullen'}.each do |short, name|
    Category.create(short_name: short, name: name, position: position)
    position +=1
  end
end

if Circle.count == 0
  ['Oogst', 'Kleding', 'Den Bosch'].each do |c|
    Circle.create(name: c, description: c)
  end
end