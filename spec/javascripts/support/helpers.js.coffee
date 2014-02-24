@currentRouteIs = (routeName) ->
  AddressBook.__container__.lookup('controller:application').currentRouteName.should.equal routeName

@routesTo = (url, routeName) ->
  visit(url).andThen -> currentRouteIs routeName

@hasAttribute = (model, attribute, type) ->
  test_subject = AddressBook[model].metaForProperty(attribute)
  test_subject.type.should.equal type
  test_subject.isAttribute.should.equal true
