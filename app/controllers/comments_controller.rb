class CommentsController < ApplicationController

  before_action :find_item, only: [:show]
  before_action :check_if_admin, only: [ :edit, :update, :destroy]

  def index
  end

  def show
  end

  def new
  	@comment = Comment.new
  end

  def create
  	@ticket = Ticket.find(params[:ticket_id])
  	@comment = @ticket.comments.create(comment_params)
  	redirect_to ticket_path(@ticket)
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

  def find_item
    @ticket = Ticket.find(params[:id])
	end

  def comment_params
    params.require(:comment).permit(:user_id, :user, :body).merge(:user_id => current_user.id, :user => current_user.login)
  end

	def check_if_admin
    @ticket = Ticket.find(params[:id])
    render_404 unless @ticket
    render text: "Acces denied", status: 403 unless current_user.admin == true
	end

end
