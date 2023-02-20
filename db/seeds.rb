t1= Team.create!(
name: 'Texas',
description: 'Best rivalry',
coach: 'Mike',
uid: 1,
full: "full"
)

t2= Team.create!(
name: 'Usa',
description: 'Dont fall behind',
coach: 'Stephen',
uid: 2,
full: "not full"
)

t3= Team.create!(
name: 'India',
description: 'standing in first',
coach: 'Sachin',
full: "not full"
)

t4= Team.create!(
name: 'united Kingdom',
description: 'Greater than anyone',
coach: 'Masood',
full: "not full"
)

t5= Team.create!(
name: 'Dallas',
description: 'Up to the mark',
coach: 'Kush',
full: "not full"
)

user1 = User.create!(
  email: 'bob@email.com',
  password:'password',
  bio: "I play hockey",
  dob: Date.new(2001,11,1),
  name: 'Bob',
  interests: 'casual',
  location: 'Memphis',
  position: 'forward',
  team: t1
)


user2 = User.create!(
  email: 'hobbes@email.com',
  password: 'password',
  bio: "Greatest hockey player of all time",
  dob: Date.new(1989,1,23),
  name: 'Hobbes',
  interests: 'professional',
  location: 'Nashville',
  position: 'forward', 
  team: t2
)

user3 = User.create!(
  email: 'chris@email.com',
  password: 'password',
  bio: "Nothing gets past me",
  dob: Date.new(1999,3,23),
  name: 'Chris',
  interests: 'professional',
  location: 'St.Louis',
  position: 'defender',
  team: t1
)

user4 = User.create!(
  email:    'jordan@email.com',
  password: 'password',
  bio: "Hockey rules!",
  dob: Date.new(1989,3,20),
  name: 'Jordan',
  interests: 'professional',
  location: 'Memphis',
  position: 'defender',
  team: t1
)

user5 = User.create!(
  email:    'buck@email.com',
  password: 'password',
  bio: "Just here to learn the game",
  dob: Date.new(1992,2,21),
  name: 'Buck',
  interests: 'casual',
  location: 'St.Louis',
  position: 'forward',
  team: t2
)

user6 = User.create!(
  email:    'rob@email.com',
  password: 'password',
  bio: "I just keep winning",
  dob: Date.new(1992,2,21),
  name: 'Robert',
  interests: 'professional',
  location: 'Nashville',
  position: 'defender',
  team: t2
)

user7 = User.create!(
  email:    'chan@email.com',
  password: 'password',
  bio: "Just keep winning",
  dob: Date.new(1992,2,21),
  name: 'Chandler',
  interests: 'professional',
  location: 'Memphis',
  position: 'forward',
  team: t3
)

user8 = User.create!(
  email:    'holt@email.com',
  password: 'password',
  bio: "Trust the process",
  dob: Date.new(1992,2,21),
  name: 'Holt',
  interests: 'professional',
  location: 'Nashville',
  position: 'midfielder',
  team: t1
)

user9 = User.create!(
  email:    'nick@email.com',
  password: 'password',
  bio: "I just keep winning",
  dob: Date.new(1992,2,21),
  name: 'Nikolai',
  interests: 'casual',
  location: 'Memphis',
  position: 'midfielder',
  team: t2
)


g1=Group.create!(
  name: 'Bengal tigers',
  star_player: nil,
  interests:'casual',
  location:'St.Louis',
  member_type: 'forward',
  description: 'go hockey',
)
g1.group_image.attach(io: File.open(('app/assets/images/player.jpg')), filename: 'player.jpg')

g2=Group.create!(
  name: 'Balayya battalion',
  star_player: 'yuvi',
  interests:'professional',
location:'Memphis',
  member_type: nil,
  description: 'hockey strikers',
)
g2.group_image.attach(io: File.open('app/assets/images/player.jpg'),
                  filename: 'player.jpg')

g3=Group.create!(
  name: 'Memphis strikers',
  star_player: nil,
  member_type: 'defender',
  interests: nil,
location: nil,
  description: 'hockey strikers',
)
g3.group_image.attach(io: File.open('app/assets/images/player.jpg'),
filename: 'player.jpg')

GroupParticipation.create!(
  group_id: 1,
  user_id: 2,
  admin: "true"
)

GroupParticipation.create!(
  group_id: 1,
  user_id: 5,
  admin: "false"
)

GroupParticipation.create!(
  group_id: 2,
  user_id: 4,
  admin: "true"
)

GroupParticipation.create!(
  group_id: 2,
  user_id: 7,
  admin: "true"
)

GroupParticipation.create!(
  group_id: 3,
  user_id: 1,
  admin: "true"
)

GroupParticipation.create!(
  group_id: 3,
  user_id: 2,
  admin: "false"
)

GroupParticipation.create!(
  group_id: 3,
  user_id: 4,
  admin: "false"
)

GroupParticipation.create!(
  group_id: 3,
  user_id: 6,
  admin: "false"
)


Event.create!(
  eventname: 'Hockey league',
  date: '12/12/2022',
  user: user1
)

Event.create!(
  eventname: 'Tennessee State league',
  date: '12/12/2022',
  user: user2
)

EventParticipation.create!(
  event_id: 1,
  team_id: 1
)

EventParticipation.create!(
  event_id: 1,
  team_id: 2
)

EventParticipation.create!(
  event_id: 2,
  team_id: 3
)

EventParticipation.create!(
  event_id: 2,
  team_id: 4
  )
Venue.create!(
  picture: 'venue1.jpeg',
  city: 'Memphis',
  stadium: 'A P J kalam stadium',
  capacity: 12000
)
Venue.create!(
  picture: 'venue.jpeg',
  city: 'Nashville',
  stadium: 'M L king stadium',
  capacity: 13000
)
Discussion.create!(
  content: "Hello peeps welcome to our group!",
  uid: 1,
  group: g3
)
Discussion.create!(
  content: "Hi Bob! What's up",
  uid: 2,
  group: g3
)