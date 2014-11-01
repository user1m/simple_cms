class PagesController < ApplicationController

  layout "admin"

  before_action :confirm_logged_in

  before_action :find_subject

  def index
    #@pages = Page.where(:subject_id => @subject.id).sorted
    @pages = @subject.pages.sorted
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new({:subject_id => @subject.id, :name => "Default"})
    @page_count = Page.count + 1
    @subjects = Subject.order('position ASC')
  end

  def create
    @page = Page.new(page_params)

    if @page.save
      flash[:notice] = "Page sucessfully created"
      redirect_to(:action => 'index', :subject_id => @subject.id)
    else
      @page_count = Page.count + 1
      @subjects = Subject.order('position ASC')
      render("new")
    end
  end

  def edit
    @page = Page.find(params[:id])
    @page_count = Page.count 
    @subjects = Subject.order('position ASC')
  end

  def update
    @page = Page.find(params[:id])

    if @page.update_attributes(page_params)
      flash[:notice] = "Page sucessfully updated"
      redirect_to(:action => "show", :id => @page.id, :subject_id => @subject.id)
    else
      @page_count = Page.count 
      @subjects = Subject.order('position ASC')
      render('edit')
    end
  end

  def delete
    @page = Page.find(params[:id])
  end

  def destroy
    page = Page.find(params[:id]).destroy
    flash[:notice] = "Page '#{page.name}'sucessfully deleted"
    redirect_to(:action => "index", :subject_id => @subject.id)
  end

  private
  def page_params
    params.require(:page).permit(:subject_id, :page, :permalink, :position, :visible)
  end

  def find_subject
    if params[:subject_id]
      @subject = Subject.find(params[:subject_id])
    end
  end
end
