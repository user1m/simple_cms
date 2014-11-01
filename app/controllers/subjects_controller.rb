class SubjectsController < ApplicationController

  layout "admin"

  before_action :confirm_logged_in

  def index
    @subjects = Subject.sorted #done back in model/subject.rb scope
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new
    @subject_count = Subject.count + 1
  end

  def create
    # instanitate
    @subject = Subject.new(subject_params)
    # save object
    if @subject.save
      #if save succeeds, redirect to somwewhere
      flash[:notice] = "Subject created sucessfully"
      redirect_to(:action => "index")
    else
      #if save fails, redisplay form
      @subject_count = Subject.count + 1
      render("new") #nothing in new action is called so need to provide all the variable
    end

  end

  def edit
    @subject = Subject.find(params[:id])
    @subject_count = Subject.count
  end

  def update
    # find exisitng object
    @subject = Subject.find(params[:id])
    # update attibutes
    if @subject.update_attributes(subject_params)
      # if suceeds, redirect to an action
      flash[:notice] = "Subject updated sucessfully"
      redirect_to(:action => 'show', :id => @subject.id)
    else
      #else redisplay edit form
      @subject_count = Subject.count
      render('edit')
    end
  end

  def delete
    @subject = Subject.find(params[:id])
  end

  def destroy
    subject = Subject.find(params[:id]).destroy
    flash[:notice] =  "Subject '#{subject.name}' deleted sucessfully"
    redirect_to(:action => 'index')
  end

  private

  def subject_params
      # same as using "params[:subject]", except that it:
      # - raises an error if :subject is not present
      # - allows listed attributes to be mass-assigned
      params.require(:subject).permit(:name, :position, :visible, :created_at)
    end
  end
