describe 'Routing', ->

  it '/', -> routesTo '/', 'index'

  it '/contacts', -> routesTo '/contacts', 'contacts.index'

  it '/contacts/1', ->
    create('contact').then (contact) ->
      routesTo "/contacts/#{contact.id}", 'contacts.show'
