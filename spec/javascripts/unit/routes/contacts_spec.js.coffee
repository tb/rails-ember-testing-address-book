module 'Routing unit',

test 'root', ->
  routesTo '/', 'index'

test '/contacts', ->
  routesTo '/contacts', 'contacts.index'

test '/contacts/1', ->
  create('contact').then (contact) ->
    routesTo "/contacts/#{contact.id}", 'contacts.show'
