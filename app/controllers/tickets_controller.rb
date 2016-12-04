class TicketsController < ApplicationController

  before_action :find_item, only: [:show, :edit, :update, :destroy]
  # before_action :check_if_admin, only: [:edit, :update, :new, :create, :destroy]

  def index
  	@tickets = Ticket.all
  	# render text: @tickets.map { |i| "#{i.title}: #{i.status}: #{i.created_at}"}.join("br/") 
  end

  # /tickets/1 GET
  def show
  	@ticket = Ticket.where(id: params[:id]).first
  	unless @ticket 
      render text: "Page not found", status: 404
  	end
  end

  # /items/new GET
  def new
  	@ticket = Ticket.new
  end

  # /tickets POST
  def create
  	@ticket = Ticket.create(ticket_params)
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
  	  redirect_to ticket_path(@ticket)
  	else
  	  render "edit"
  	end
  end

  # /tickets/1 DELETE
  def destroy
  end

  private

    def find_item
	  @ticket = Ticket.where(id: params[:id]).first
	  render_404 unless @ticket
	end

    def ticket_params
	  params.require(:ticket).permit(:title, :content, :status, :admin_fio)		
	end

	# def check_if_admin
 #      @check = params.require(:user).permit(:admin)
 #      render text: "Acces denied", status: 403 unless @check == 1
	# end

end
