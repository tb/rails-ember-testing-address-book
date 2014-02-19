module 'Routing unit',
  setup: ->
  teardown: ->
    AddressBook.reset()

test 'root route', ->
  routesTo '/', 'index'

test 'contacts route', ->
  routesTo '/contacts', 'contacts.index'
