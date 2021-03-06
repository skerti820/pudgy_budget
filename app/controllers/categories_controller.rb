class CategoriesController < ApplicationController
  def index
    @q = Category.ransack(params[:q])
    @categories = @q.result(:distinct => true).includes(:bucket, :transactions, :budgets).page(params[:page]).per(10)

    render("category_templates/index.html.erb")
  end

  def show
    @budget = Budget.new
    @transaction = Transaction.new
    @category = Category.find(params.fetch("id_to_display"))

    render("category_templates/show.html.erb")
  end

  def new_form
    @category = Category.new

    render("category_templates/new_form.html.erb")
  end

  def create_row
    @category = Category.new

    @category.name = params.fetch("name")
    @category.transation_id = params.fetch("transation_id")

    if @category.valid?
      @category.save

      redirect_back(:fallback_location => "/categories", :notice => "Category created successfully.")
    else
      render("category_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_bucket
    @category = Category.new

    @category.name = params.fetch("name")
    @category.transation_id = params.fetch("transation_id")

    if @category.valid?
      @category.save

      redirect_to("/buckets/#{@category.transation_id}", notice: "Category created successfully.")
    else
      render("category_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @category = Category.find(params.fetch("prefill_with_id"))

    render("category_templates/edit_form.html.erb")
  end

  def update_row
    @category = Category.find(params.fetch("id_to_modify"))

    @category.name = params.fetch("name")
    @category.transation_id = params.fetch("transation_id")

    if @category.valid?
      @category.save

      redirect_to("/categories/#{@category.id}", :notice => "Category updated successfully.")
    else
      render("category_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_bucket
    @category = Category.find(params.fetch("id_to_remove"))

    @category.destroy

    redirect_to("/buckets/#{@category.transation_id}", notice: "Category deleted successfully.")
  end

  def destroy_row
    @category = Category.find(params.fetch("id_to_remove"))

    @category.destroy

    redirect_to("/categories", :notice => "Category deleted successfully.")
  end
end
