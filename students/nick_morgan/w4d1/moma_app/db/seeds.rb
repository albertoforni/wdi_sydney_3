Artist.delete_all



Artist.create(:name => 'Joan Miro', 
  :nationality => 'Spanish',
  :dob => '1893/04/20',
  :period => '20th century',
  :image => 'http://uploads0.wikipaintings.org/images/joan-miro(1).jpg!Portrait.jpg'
  )

Painting.delete_all

Painting.create(:title => 'Thuvia, Maid of Mars',
  :year => '1967',
  :medium => 'oils',
  :style => 'fantasy',
  :image => 'http://images.tcj.com/2011/02/frank_frazetta_thuviamaidofmars.jpg'
  )