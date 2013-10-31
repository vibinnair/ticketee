Ticketee::Application.routes.draw do
  # When / is received the root route is called. 
  # We say that when root route is called we will point to ProjectController's Index action.
  root :to => "projects#index"     

end
