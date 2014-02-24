describe 'Contacts integration', ->
  beforeEach ->
    create('contact')
    create('contact')
    visit '/contacts'

  it  'header', ->
    find('.contacts_heading').text().should.equal 'Now in the Contacts Index'

  it 'contacts list', ->
    find('.contacts_list li').should.have.length 2

  it 'contact link', ->
    create('contact').then (contact) ->
      visit('/contacts').click 'ul li:last a'
      andThen ->
        find('#contact h1').text().should.equal "Details for Contact #{contact.id}"

  it 'contact url', ->
    create('contact').then (contact) ->
      visit "/contacts/#{contact.id}"
      find('#contact h1').text().should.equal "Details for Contact #{contact.id}"
