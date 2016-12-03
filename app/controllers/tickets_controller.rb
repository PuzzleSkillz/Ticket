class TicketsController < ApplicationController


  before_action :check_if_admin, only: [:edit, :update, :new, :create, :destroy]

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
  end

  # /tickets/1 DELETE
  def destroy
  end

  private

    def ticket_params
	  params.require(:ticket).permit(:title, :content, :status, :user_id)		
	end

	# def check_if_admin
 #      @check = params.require(:user).permit(:admin)
 #      render text: "Acces denied", status: 403 unless @check == 1
	# end

end
