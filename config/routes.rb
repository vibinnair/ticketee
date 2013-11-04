Ticketee::Application.routes.draw do
  # When / is received the root route is called. 
  # We say that when root route is called we will point to ProjectController's Index action.
  # We use the "root" method to specify the root route
  root :to => "projects#index"

  # A resource route is basically a collection/bundle of all routes for a given resource.
  # It is like a package of all routes that gets applied on the mentioned resource.
  # We use the "resources" method to add a resource in the route table
  # A resource route also makes helper functions available to us i.e it creates an alias
  # for each route 
  # Eg: If you do rake routes... you see  
  # projects GET  "/projects" projects#index
  # this means that this route will match the url of type http://xyz.com/projects
  # this route will call index action in projects controller when matched
  # this route has been named an alias "projects". (i.e the value in first column before GET)  
  # It is similiar to writing GET "/projects", projects#index, as:projects (Ref:http://guides.rubyonrails.org/routing.html)
  # Due to this alias two helper functions also becomes available for generating the url's whenever required.
  # i.e alias_path for generating the relative url and alias_url for generating the absolute path.(Ref: Rails 3 in Action)
  # Hence in case of alias new_project we get two helpers viz. 
  # new_project_path which will generate '/project' (relative url) and
  # new_project_url which will generate 'http://xyz.com/project' (absolute url)

  resources :projects

end
