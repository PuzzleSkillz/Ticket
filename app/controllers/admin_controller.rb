class AdminController < ApplicationController

	before_action :find_item, only: [:edit, :update]
	before_action :check_if_admin, only: [:show ,:index, :edit, :update, :destroy]

	def index
		@show_tickets = Ticket.all
		@show_users = User.all
	end

	# /admin/1 GET
	def show
      if user_signed_in?
  	    @ticket = Ticket.where(id: params[:id]).first
        render_404 unless @ticket
      else
        redirect_to new_user_session_path
      end
	end
	
	  # /admin/new GET
    def new
    end

    # /admin POST
    def create
    end

    # /admin/1/edit GET
    def edit
    end

    # /admin/1 PUT
    def update
    end

    # /admin/1 DELETE
    def destroy
    end

    private

    def find_item
      @ticket = Ticket.find(params[:id])
      render_404 unless @ticket
	end

	def check_if_admin
    render text: "Acces denied", status: 403 unless current_user.admin == true
	end

end
