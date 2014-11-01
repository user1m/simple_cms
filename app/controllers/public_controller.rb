class PublicController < ApplicationController

	layout 'public'

	before_action :setup_nav  	

	def index
	# text
end

def show
	@page = Page.where(:permalink => params[:permalink], :visible => true).first
	if @page.nil?
		redirect_to(:action => 'index')
	else
  			#display content in show
  		end
  	end

  	private
  	def setup_nav
  		@subjects = Subject.visible.sorted
  	end
  end
