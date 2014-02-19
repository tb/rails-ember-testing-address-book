AddressBook.Contact = DS.Model.extend
  first_name: DS.attr 'string'
  last_name:  DS.attr 'string'

AddressBook.Contact.FIXTURES = [
  id: 1
  first_name: 'Dave'
  last_name: 'Crack'
,
  id: 2
  first_name: 'Dustin'
  last_name: 'Hoffman'
]
