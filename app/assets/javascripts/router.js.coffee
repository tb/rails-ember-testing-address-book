# For more information see: http://emberjs.com/guides/routing/

AddressBook.Router.map () ->
  @resource 'contacts', ->
    @route 'show', { path: '/:contact_id' }
