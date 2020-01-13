require './config/environment'

# Rack::MethodOverride must be placed above ALL controllers
# to maintain access to the middleware's functionality.
use Rack::MethodOverride
# This middleware will then run for every request sent by our application.
# It will interpret any requests with name="_method" by translating the
# request to whatever is set by the value attribute. In this example, the
# post gets translated to a patch request. The middleware handles PUT and
# DELETE in the same way.

#controller(s)
run ApplicationController
