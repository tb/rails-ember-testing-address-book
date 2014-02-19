module 'Contacts integration',
  setup: ->
    create('contact')
    create('contact')

test 'contacts route', ->
  visit '/contacts'
  andThen ->
    header_text = find('.contacts_heading').text()
    equal header_text, "Now in the Contacts Index", 'Expected "Now in the Contacts Index", got: ' + header_text

test 'contacts rendering', ->
  visit '/contacts'
  andThen ->
    contacts_length = find('.contacts_list li').length
    equal(contacts_length, 2, "Expected contacts to contain 2 items, got: #{contacts_length}");

test 'contact rendering', ->
  create('contact').then (contact) ->
    visit "/contacts/#{contact.id}"
    andThen ->
      text = find('#contact h1').text()
      expected_result = "Details for Contact #{contact.id}"
      equal text, expected_result, "Expected: #{expected_result} got: #{text}"

test 'visiting a contact via the index screen', ->
  create('contact').then (contact) ->
    visit('/contacts').click 'ul li:last a'
    andThen ->
      text = find('#contact h1').text()
      expected_result = "Details for Contact #{contact.id}"
      equal text, expected_result, "Expected: #{expected_result} got: #{text}"
