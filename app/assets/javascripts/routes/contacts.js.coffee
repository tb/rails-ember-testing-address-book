AddressBook.ContactsIndexRoute = Ember.Route.extend
  model: -> @store.find 'contact'

AddressBook.ContactsShowRoute = Ember.Route.extend
  model: (params) -> @store.find 'contact', params.contact_id
