@currentRouteIs = (routeName) ->
  currentRouteName = AddressBook.__container__.lookup('controller:application').currentRouteName
  equal currentRouteName, routeName, "Expected #{routeName} got: #{currentRouteName}"

@routesTo = (url, routeName) ->
  visit(url).andThen -> currentRouteIs routeName

@hasAttribute = (model, attribute, type) ->
  test_subject = AddressBook[model].metaForProperty(attribute)
  equal test_subject.type, type, "Expected " + type + " got: " + test_subject.type
  ok test_subject.isAttribute
