class DemoController < ApplicationController
  
  layout 'application'
  
  def index
  	#render('hello') #name of the template to use
  end

  def hello
  	#render('index')
    @array = [1,2,3,4,5]
    #@array = "Claudius"
    @id = params['id'].to_i
    @page = params[:page].to_i
    @q = params['query']
  end

  def other_hello
  	redirect_to(:controller =>'demo', :action => 'index')
  end

  def fund
  	redirect_to("http://fundstarter.co")
  end

  def text_helpers

  end

  def escape_output
  end

  def make_error
    # My guesses for the 3 most common errors:
    #render(:text => "test" # syntax error, unexpected X, expecting Y
    #render(:text => @something.upcase) # undefined method on nil
    render(:text => "1" + 1) # can't convert type
  end

  def logging
    logger.debug("This is debug.")
    logger.info("This is info.")
    logger.warn("This is warn.")
    logger.error("This is error.")
    logger.fatal("This is fatal.")
    render(:text => 'Logged!')
  end
end
