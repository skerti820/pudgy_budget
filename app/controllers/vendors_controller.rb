class VendorsController < ApplicationController
  def index
    @vendors = Vendor.all

    render("vendor_templates/index.html.erb")
  end

  def show
    @transaction = Transaction.new
    @vendor = Vendor.find(params.fetch("id_to_display"))

    render("vendor_templates/show.html.erb")
  end

  def new_form
    @vendor = Vendor.new

    render("vendor_templates/new_form.html.erb")
  end

  def create_row
    @vendor = Vendor.new

    @vendor.name = params.fetch("name")
    @vendor.deleted = params.fetch("deleted")

    if @vendor.valid?
      @vendor.save

      redirect_back(:fallback_location => "/vendors", :notice => "Vendor created successfully.")
    else
      render("vendor_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @vendor = Vendor.find(params.fetch("prefill_with_id"))

    render("vendor_templates/edit_form.html.erb")
  end

  def update_row
    @vendor = Vendor.find(params.fetch("id_to_modify"))

    @vendor.name = params.fetch("name")
    @vendor.deleted = params.fetch("deleted")

    if @vendor.valid?
      @vendor.save

      redirect_to("/vendors/#{@vendor.id}", :notice => "Vendor updated successfully.")
    else
      render("vendor_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @vendor = Vendor.find(params.fetch("id_to_remove"))

    @vendor.destroy

    redirect_to("/vendors", :notice => "Vendor deleted successfully.")
  end
end
