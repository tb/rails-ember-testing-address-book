# http://emberjs.com/guides/models/using-the-store/

AddressBook.Store = DS.Store.extend()

#AddressBook.ApplicationAdapter = DS.ActiveModelAdapter.extend()
AddressBook.ApplicationAdapter = DS.FixtureAdapter.extend()
