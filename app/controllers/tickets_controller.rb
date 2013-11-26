class TicketsController < ApplicationController
	before_filter :find_project # no options are required as in case of ticket this method has to 
								# run before all the actions in TicketController.  

	before_filter :find_ticket, :only => [	:show, 
										  	:edit,
											:update, 
											:destroy]

	def new
		@ticket = @project.tickets.build
	end

	def create
		@ticket = @project.tickets.build(params[:ticket])
		if @ticket.save
			flash[:notice] = "Ticket has been created."
			redirect_to [@project, @ticket]  # => same as calling redirect_to project_ticket_path(@project, @ticket)
		else
			flash[:alert] = "Ticket has not been created."
			render :action => "new"
		end 
	end

	def show
	end

	def edit 
	end

	def update
		# @ticket and @project are already being obtained in the before_filter, so no need to find them.
		if @ticket.update_attributes(params[:ticket])
			flash[:notice] = "Ticket has been updated."
			redirect_to project_ticket_path(@project, @ticket)
		else
			flash[:alert] = "Ticket has not been updated."
			render :action => "edit"
		end
	end

	def destroy
		@ticket.destroy()
		flash[:notice] = "Ticket has been deleted."
		redirect_to @project  # => same as calling redirect_to project_path(@project) i.e the show action.
	end

	private 
	def find_project
		@project = Project.find(params[:project_id])
	end

	def find_ticket
		@ticket = @project.tickets.find(params[:id])
	end
end


# render if you want to maintain/retain the instance objects and display the page.
# redirect if you do not want to maintain the object and display a fresh page(i.e without any current object information).