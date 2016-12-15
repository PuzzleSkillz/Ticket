class TicketsController < ApplicationController


  before_action :find_item, only: [:show, :comment]
  before_action :check_if_admin, only: [ :edit, :update, :destroy]
  def index
    if user_signed_in?
  	  @tickets = Ticket.where(company_name: current_user.company_name)
    else
      redirect_to new_user_session_path
    end

    if user_signed_in? && current_user.admin == true
      redirect_to admin_index_path
    end
  end

  # /tickets/1 GET
  def show
  	  @ticket = Ticket.where(id: params[:id]).first
      authorize! :show, @ticket
  end

  # /tickets/new GET
  def new
  	@ticket = Ticket.new
  end

  # /tickets POST
  def create
  	@ticket = current_user.tickets.create(ticket_params)
  	if @ticket.errors.empty?
  	  redirect_to ticket_path(@ticket)
  	else
  	  render "new"
  	end
  end

  # /tickets/1/edit GET
  def edit
  end

  # /tickets/1 PUT
  def update
  	@ticket.update_attributes(ticket_params)
  	if @ticket.errors.empty?
  	  redirect_to admin_path(@ticket)
  	else
  	  render "edit"
  	end
  end

  # /tickets/1 DELETE
  def destroy
    @ticket.destroy
    redirect_to action: "index"
  end

  def comment
  end

  private

  def find_item
    @ticket = Ticket.find(params[:id])
	end

  def ticket_params
    params.require(:ticket).permit(:title, :content, :status, :admin_fio, :user_id, :company_name, :file).merge(:company_name => current_user.company_name)
  end

	def check_if_admin
    @ticket = Ticket.find(params[:id])
    render_404 unless @ticket
    # render text: "Acces denied", status: 403 unless current_user.admin == true
	end

end
