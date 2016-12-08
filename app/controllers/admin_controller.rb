class AdminController < ApplicationController

	def index
	  if user_signed_in? && current_user.admin == true
		  @show_tickets = Ticket.all
		  @show_users = User.all
	  end
	end

	def show
		redirect_to ticket_path
	end
	
    def new
    end

    def create
    end

    def edit
    end

    def update
    end


    def destroy
    end

end
