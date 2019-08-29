class BudgetsController < ApplicationController
  def index
    @budgets = Budget.all

    render("budget_templates/index.html.erb")
  end

  def show
    @budget = Budget.find(params.fetch("id_to_display"))

    render("budget_templates/show.html.erb")
  end

  def new_form
    @budget = Budget.new

    render("budget_templates/new_form.html.erb")
  end

  def create_row
    @budget = Budget.new

    @budget.description = params.fetch("description")
    @budget.category_id = params.fetch("category_id")
    @budget.deleted = params.fetch("deleted")
    @budget.month_date = params.fetch("month_date")

    if @budget.valid?
      @budget.save

      redirect_back(:fallback_location => "/budgets", :notice => "Budget created successfully.")
    else
      render("budget_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @budget = Budget.find(params.fetch("prefill_with_id"))

    render("budget_templates/edit_form.html.erb")
  end

  def update_row
    @budget = Budget.find(params.fetch("id_to_modify"))

    @budget.description = params.fetch("description")
    @budget.category_id = params.fetch("category_id")
    @budget.deleted = params.fetch("deleted")
    @budget.month_date = params.fetch("month_date")

    if @budget.valid?
      @budget.save

      redirect_to("/budgets/#{@budget.id}", :notice => "Budget updated successfully.")
    else
      render("budget_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @budget = Budget.find(params.fetch("id_to_remove"))

    @budget.destroy

    redirect_to("/budgets", :notice => "Budget deleted successfully.")
  end
end
