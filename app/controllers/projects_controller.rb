class ProjectsController < ApplicationController
	# By default before_filters are run\called before all the actions of project controller.
	# However this can be controlled by using :only or :except options.
	# :only can be used to mention actions before which the filter should be called.
	# :except can be used to mention actions before which the filter should not be called.
	before_filter :find_project, :only => [	:show,
											:edit,
											:update,
											:destroy]

	def index
		@projects = Project.all
	end

	def new
		@project = Project.new
	end

	def create
		@project = Project.new(params[:project])
		if @project.save
			flash[:notice] = "Project has been created."
			redirect_to @project
		else
			flash[:alert] = "Project has not been created."
			render :action => "new"
		end
	end

	def show
		# commenting out as this line is being handelled by before_filter
		# @project = Project.find(params[:id])
	end

	def edit
		# commenting out as this line is being handelled by before_filter
		# @project = Project.find(params[:id])
	end

	def update
		# commenting out as this line is being handelled by before_filter
		# @project = Project.find(params[:id])

		# update the table records with whatever has changed in params[:project] 
		if @project.update_attributes(params[:project])  
			flash[:notice] = "Project has been updated."
			redirect_to @project
		else
			flash[:alert] = "Project has not been updated."
			render :action => "edit"
		end
	end

	def destroy
		# commenting out as this line is being handelled by before_filter
		# project = Project.find(params[:id])
		@project.destroy
		flash[:notice] = "Project has been deleted."
		redirect_to projects_path
	end

	private   # As this method has private method before it, the controller cannot respond to this 
			  #	method as an action. i.e nobody can call this method. 
		def find_project
			@project = Project.find(params[:id])
			rescue ActiveRecord::RecordNotFound
				flash[:alert] = "The project you were looking for could not be found."	 
			redirect_to projects_path
		end
end


# Question: When is id passed and when is the entire project passed in the params[]
