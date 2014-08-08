class Backend::SettingsController < ApplicationController
	layout 'backend'

	def edit
		@setting = Setting.first
		if @setting.nil?
			@setting = Setting.new
			@setting.slogan = "ศูนย์รวมที่ดิน (slogan) Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiuxsod"
			@setting.contact_us_footer = "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec libero. Suspendisse bibendum. Cras id urna. Morbi tincidunt, orci ac convallis aliquam, lectus turpis varius lorem, eu posuere nunc justo tempus leo. llorem, eu posuere nunc justo tempus leo. Donec mattis, purus nec placerat bibendum"
			@setting.contact_us = "Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo."
			@setting.address = "13/2 Elizabeth Street Melbourne; Australia"
			@setting.call_us = "1900-CO-WORKER; 1800-3322-4453"
			@setting.email = "contact management; contact support"
			@setting.save
		end
	end

	def update
		@setting = Setting.first

		if @setting.update_attributes(setting_params)
			redirect_to edit_backend_setting_path(1), :notice => "บันทึกการตั้งค่าแล้ว"
		else
			render :edit 
		end
	end

	private 
	def setting_params
		params.require(:setting).permit(
			:slogan,
			:contact_us_footer,
			:contact_us,
			:address,
			:call_us,
			:email
		)
	end
end
