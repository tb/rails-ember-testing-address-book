module 'unit/models/contact',
  setup: ->

  teardown: ->
    AddressBook.reset()

test 'attributes', ->
  hasAttribute 'Contact', 'first_name', 'string'
  hasAttribute 'Contact', 'last_name', 'string'
