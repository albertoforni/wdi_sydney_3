Artist.delete_all

Artist.create(
    :name => 'Joan Miro',
    :nationality => 'Spanish',
    :dob => '1893/04/20',
    :period => '20th century',
    :image => 'http://uploads0.wikipaintings.org/images/joan-miro(1).jpg!Portrait.jpg'
)

Painting.create(
    :title => 'Carnival of Harlequin',
    :year => '1924',
    :medium => 'painting',
    :style => 'Surrealism',
    :image => 'http://uploads5.wikipaintings.org/images/joan-miro/harlequin-s-carnival-1925.jpg'
)