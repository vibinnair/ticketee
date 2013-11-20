class TicketsController < ApplicationController
	before_filter :find_project # no options are required as in case of ticket this method has to 
								# run before all the actions in TicketController.  

	before_filter :find_ticket, :only => [:show]							

	def new
		@ticket = @project.tickets.build
	end

	def create
		@ticket = @project.tickets.build(params[:ticket])
		if @ticket.save
			flash[:notice] = "Ticket has been created."
			redirect_to [@project, @ticket] 
		else
			flash[:alert] = "Ticket has not been created."
			render :action => "new"
		end 
	end

	def show
	end

	private 
	def find_project
		@project = Project.find(params[:project_id])
	end

	def find_ticket
		@ticket = @project.tickets.find(params[:id])
	end
end
