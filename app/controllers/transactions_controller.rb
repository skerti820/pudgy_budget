class TransactionsController < ApplicationController
  def index
    @transactions = Transaction.page(params[:page]).per(10)

    render("transaction_templates/index.html.erb")
  end

  def show
    @transaction = Transaction.find(params.fetch("id_to_display"))

    render("transaction_templates/show.html.erb")
  end

  def new_form
    @transaction = Transaction.new

    render("transaction_templates/new_form.html.erb")
  end

  def create_row
    @transaction = Transaction.new

    @transaction.description = params.fetch("description")
    @transaction.vendor_id = params.fetch("vendor_id")
    @transaction.category_id = params.fetch("category_id")
    @transaction.deleted = params.fetch("deleted")
    @transaction.user_id = params.fetch("user_id")
    @transaction.purchase_date = params.fetch("purchase_date")
    @transaction.amount = params.fetch("amount")

    if @transaction.valid?
      @transaction.save

      redirect_back(:fallback_location => "/transactions", :notice => "Transaction created successfully.")
    else
      render("transaction_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_category
    @transaction = Transaction.new

    @transaction.description = params.fetch("description")
    @transaction.vendor_id = params.fetch("vendor_id")
    @transaction.category_id = params.fetch("category_id")
    @transaction.deleted = params.fetch("deleted")
    @transaction.user_id = params.fetch("user_id")
    @transaction.purchase_date = params.fetch("purchase_date")
    @transaction.amount = params.fetch("amount")

    if @transaction.valid?
      @transaction.save

      redirect_to("/categories/#{@transaction.category_id}", notice: "Transaction created successfully.")
    else
      render("transaction_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_vendor
    @transaction = Transaction.new

    @transaction.description = params.fetch("description")
    @transaction.vendor_id = params.fetch("vendor_id")
    @transaction.category_id = params.fetch("category_id")
    @transaction.deleted = params.fetch("deleted")
    @transaction.user_id = params.fetch("user_id")
    @transaction.purchase_date = params.fetch("purchase_date")
    @transaction.amount = params.fetch("amount")

    if @transaction.valid?
      @transaction.save

      redirect_to("/vendors/#{@transaction.vendor_id}", notice: "Transaction created successfully.")
    else
      render("transaction_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @transaction = Transaction.find(params.fetch("prefill_with_id"))

    render("transaction_templates/edit_form.html.erb")
  end

  def update_row
    @transaction = Transaction.find(params.fetch("id_to_modify"))

    @transaction.description = params.fetch("description")
    @transaction.vendor_id = params.fetch("vendor_id")
    @transaction.category_id = params.fetch("category_id")
    @transaction.deleted = params.fetch("deleted")
    @transaction.user_id = params.fetch("user_id")
    @transaction.purchase_date = params.fetch("purchase_date")
    @transaction.amount = params.fetch("amount")

    if @transaction.valid?
      @transaction.save

      redirect_to("/transactions/#{@transaction.id}", :notice => "Transaction updated successfully.")
    else
      render("transaction_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_user
    @transaction = Transaction.find(params.fetch("id_to_remove"))

    @transaction.destroy

    redirect_to("/users/#{@transaction.user_id}", notice: "Transaction deleted successfully.")
  end

  def destroy_row_from_category
    @transaction = Transaction.find(params.fetch("id_to_remove"))

    @transaction.destroy

    redirect_to("/categories/#{@transaction.category_id}", notice: "Transaction deleted successfully.")
  end

  def destroy_row_from_vendor
    @transaction = Transaction.find(params.fetch("id_to_remove"))

    @transaction.destroy

    redirect_to("/vendors/#{@transaction.vendor_id}", notice: "Transaction deleted successfully.")
  end

  def destroy_row
    @transaction = Transaction.find(params.fetch("id_to_remove"))

    @transaction.destroy

    redirect_to("/transactions", :notice => "Transaction deleted successfully.")
  end
end
