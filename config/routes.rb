Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "buckets#index"
  # Routes for the Budget resource:

  # CREATE
  get("/budgets/new", { :controller => "budgets", :action => "new_form" })
  post("/create_budget", { :controller => "budgets", :action => "create_row" })

  # READ
  get("/budgets", { :controller => "budgets", :action => "index" })
  get("/budgets/:id_to_display", { :controller => "budgets", :action => "show" })

  # UPDATE
  get("/budgets/:prefill_with_id/edit", { :controller => "budgets", :action => "edit_form" })
  post("/update_budget/:id_to_modify", { :controller => "budgets", :action => "update_row" })

  # DELETE
  get("/delete_budget/:id_to_remove", { :controller => "budgets", :action => "destroy_row" })

  #------------------------------

  # Routes for the Vendor resource:

  # CREATE
  get("/vendors/new", { :controller => "vendors", :action => "new_form" })
  post("/create_vendor", { :controller => "vendors", :action => "create_row" })

  # READ
  get("/vendors", { :controller => "vendors", :action => "index" })
  get("/vendors/:id_to_display", { :controller => "vendors", :action => "show" })

  # UPDATE
  get("/vendors/:prefill_with_id/edit", { :controller => "vendors", :action => "edit_form" })
  post("/update_vendor/:id_to_modify", { :controller => "vendors", :action => "update_row" })

  # DELETE
  get("/delete_vendor/:id_to_remove", { :controller => "vendors", :action => "destroy_row" })

  #------------------------------

  # Routes for the Transaction resource:

  # CREATE
  get("/transactions/new", { :controller => "transactions", :action => "new_form" })
  post("/create_transaction", { :controller => "transactions", :action => "create_row" })

  # READ
  get("/transactions", { :controller => "transactions", :action => "index" })
  get("/transactions/:id_to_display", { :controller => "transactions", :action => "show" })

  # UPDATE
  get("/transactions/:prefill_with_id/edit", { :controller => "transactions", :action => "edit_form" })
  post("/update_transaction/:id_to_modify", { :controller => "transactions", :action => "update_row" })

  # DELETE
  get("/delete_transaction/:id_to_remove", { :controller => "transactions", :action => "destroy_row" })

  #------------------------------

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
