class ContactsController < ApplicationController
	layout 'frontend'

	def index
		@inbox = Inbox.new
	end

	def create
		@inbox = Inbox.new(inbox_params)

		if @inbox.valid?
			@inbox.save

			redirect_to contacts_path, :notice => "The email is already registered"
		else
			render :index
		end
	end

	private
	def inbox_params
		params.require(:inbox).permit(
			:title,
			:sender,
			:email,
			:phone,
			:message
		)
	end
end
