describe 'Contact', ->

  it '#first_name', -> hasAttribute 'Contact', 'first_name', 'string'

  it '#last_name',  -> hasAttribute 'Contact', 'last_name', 'string'
