class Backend::InboxesController < ApplicationController
	layout 'backend'

	def index
		params[:page] ||= 1
		@messages = Inbox.where("is_deleted = false").all.order('created_at desc').paginate(:page => params[:page])	
	end

	def show
		@message = Inbox.find(params[:id])
		@message.update_attributes(:is_read => true)
	end
	def destroy
		@message = Inbox.find(params[:id])
		@message.destroy

		redirect_to backend_inboxes_path
	end
end
