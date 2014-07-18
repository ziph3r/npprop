class Backend::ContactsController < ApplicationController
	layout 'backend'

	def index 
		@contacts = Contact.all.order("is_default desc, name")
	end

	def new
		@contact = Contact.new
	end

	def create
		@contact = Contact.new(contact_params)

		if @contact.valid?
			fail = false
			if @contact.is_default
				default = Contact.where("is_default = true").first
				fail = true if default
			end
			if !fail
				@contact.save
				redirect_to backend_contacts_path
			else
				@contact.errors.add(:is_default, "default contact สร้างได้แค่ 1 record")
				render :new
			end
		else
			render :new
		end
	end

	def show
		@contact = Contact.find(params[:id])
	end

	def edit
		@contact = Contact.find(params[:id])
	end

	def update
		@contact = Contact.find(params[:id])
		fail = false
		@contact.attributes = contact_params

		if @contact.is_default
				default = Contact.where("is_default = true").first
				fail = true
		end

		if !fail
			if @contact.valid?
				@contact.save

				redirect_to backend_contacts_path
			else
				render :edit
			end
		else
			@contact.errors.add(:is_default, "Default error")
			render :edit
		end
	end

	def destroy
		@contact = Contact.find(params[:id])
		if @contact.is_default

		else
			@contact.destroy
			default = Contact.where("is_default = true").first
			products = Product.where(
				["contact_id = ? ", params[:id]]
			).all
			products.each do |p|
				p.update_attributes(:contact_id => default.id)
			end if !default.nil?
		end

		redirect_to backend_contacts_path
	end

	private
	
	def contact_params
		params.require(:contact).permit(
			:name,
			:content,
			:is_default
		)
	end
end
