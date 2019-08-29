Rails.application.routes.draw do
  # Routes for the Category resource:

  # CREATE
  get("/categories/new", { :controller => "categories", :action => "new_form" })
  post("/create_category", { :controller => "categories", :action => "create_row" })

  # READ
  get("/categories", { :controller => "categories", :action => "index" })
  get("/categories/:id_to_display", { :controller => "categories", :action => "show" })

  # UPDATE
  get("/categories/:prefill_with_id/edit", { :controller => "categories", :action => "edit_form" })
  post("/update_category/:id_to_modify", { :controller => "categories", :action => "update_row" })

  # DELETE
  get("/delete_category/:id_to_remove", { :controller => "categories", :action => "destroy_row" })

  #------------------------------

  # Routes for the Bucket resource:

  # CREATE
  get("/buckets/new", { :controller => "buckets", :action => "new_form" })
  post("/create_bucket", { :controller => "buckets", :action => "create_row" })

  # READ
  get("/buckets", { :controller => "buckets", :action => "index" })
  get("/buckets/:id_to_display", { :controller => "buckets", :action => "show" })

  # UPDATE
  get("/buckets/:prefill_with_id/edit", { :controller => "buckets", :action => "edit_form" })
  post("/update_bucket/:id_to_modify", { :controller => "buckets", :action => "update_row" })

  # DELETE
  get("/delete_bucket/:id_to_remove", { :controller => "buckets", :action => "destroy_row" })

  #------------------------------

  devise_for :users
  # Routes for the User resource:

  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
