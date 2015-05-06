class SubscriptionController < ApplicationController
  def index

    @invoices = Subscription.get_require_invoices(params[:group_id]) #subscriptions with expired or nearly expired payments.

    @group = Group.find(params[:group_id])
    @user = current_user

    #only allow admins and troop leaders for this group to view this page.
    raise CanCan::AccessDenied.new("You are not authorized to view the requested group!") unless !current_user.get_groups.blank? && current_user.get_groups.include?(@group) && (current_user.is?(:leader) || current_user.is?(:admin))
  end

  def generate_invoices
    @invoices = Subscription.get_require_invoices(params[:group_id]) #subscriptions with expired or nearly expired payments.

    @group = Group.find(params[:group_id])
    @user = current_user
    @no_header = true
    @display_letter = true

    #only allow admins and troop leaders for this group to view this page.
    raise CanCan::AccessDenied.new("You are not authorized to view the requested group!") unless !current_user.get_groups.blank? && current_user.get_groups.include?(@group) && (current_user.is?(:leader) || current_user.is?(:admin))
    render :layout => "static_layout"
  end

  def generate_invoices_pdf
    @invoices = Subscription.get_require_invoices(params[:group_id])  #subscriptions with expired or nearly expired payments.

    @group = Group.find(params[:group_id])
    @user = current_user
    @no_header = true # dont display page header
    @display_letter = true #display form letter when generating invoices

    #only allow admins and troop leaders for this group to view this page.
    raise CanCan::AccessDenied.new("You are not authorized to view the requested group!") unless !current_user.get_groups.blank? && current_user.get_groups.include?(@group) && (current_user.is?(:leader) || current_user.is?(:admin))
    render pdf: "invoices", :layout => "static_layout"

  end

  def add_maintenance_note
    #used in view_route's view to append maintenance notes to a given subscription.
    sub = Subscription.find(params[:sub_id])
    note = DateTime.now().strftime("%m/%d/%y %H:%M:%S") + ': ' + params[:note]
    if sub.maintenance_notes.blank?
      sub.maintenance_notes = note;
    else
      sub.maintenance_notes += ", " + note
    end
    sub.save!
    render json: sub.id
  end

end
