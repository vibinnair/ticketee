class TicketsController < ApplicationController
	before_filter :find_project # no options are required as in case of ticket this method has to 
								# run before all the actions in TicketController.  

	def new
		@project = Project.find(params[:project_id])
		@ticket = @project.tickets.build
	end

	def create
		@project = Project.find(params[:project_id])
		@ticket = @project.tickets.build(params[:ticket])
		if @ticket.save
			flash[:notice] = "Ticket has been created."
			redirect_to [@project, @ticket] 
		else
			flash[:alert] = "Ticket has not been created."
			render :action => "new"
		end 
	end

	private 
	def find_project
		
	end
end
