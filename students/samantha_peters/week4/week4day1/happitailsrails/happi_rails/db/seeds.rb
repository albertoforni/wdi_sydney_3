#3 shelters, 6 animals, 4 clients

Shelter.create(
	:name => 'Yagoona RSPCA',
	:capacity => '50'
	)

Shelter.create(
	:name => 'Harris St Vetinary Clinic',
	:capacity => '10'
	)

Shelter.create(
	:name => 'Lane Cove Foster Care',
	:capacity => '3'
	)

Animal.create(
	:name => 'Lily',
	:species => 'Cat',
	:gender => 'Female',
	:age => 3,
	:favourite_toy => 'A rubber mouse',
	:adopted => false
	)

Animal.create(
	:name => 'Ellie',
	:species => 'Parrot',
	:gender => 'female',
	:age => 1,
	:favourite_toy => 'Brown paper bags',
	:adopted => false
	)

Animal.create(
	:name => 'Randle',
	:species => 'Dog',
	:gender => 'Male',
	:age => 1,
	:favourite_toy => 'Blue bone',
	:adopted => false
	)

Animal.create(
	:name => 'Bronson',
	:species => 'Dog',
	:gender => 'Male',
	:age => 4,
	:favourite_toy => 'Rawhide chew toy',
	:adopted => false
	)

Animal.create(
	:name => 'Kira',
	:species => 'Dog',
	:gender => 'Female',
	:age => 2,
	:favourite_toy => 'Rope toy',
	:adopted => false
	)

Animal.create(
	:name => 'Manuel',
	:species => 'Cat',
	:gender => 'Male',
	:age => 5,
	:favourite_toy => 'Plush cat bed',
	:adopted => false
	)

Client.create(
	:name => 'Sammyjo',
	:existing_pets => 2
	)

Client.create(
	:name => 'Thomas',
	:existing_pets => 1
	)

Client.create(
	:name => 'Crazy Cat Lady',
	:existing_pets => 32
	)

Client.create(
	:name => 'Luke Skywalker',
	:existing_pets => 3
	)