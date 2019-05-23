class EmailsController < ApplicationController
  def new
      
  end

  def index
    @emails = Email.all
  end

  def show

  end

  def create 
    @email = Email.new(email_params)

    if @email.save
      # respond_to do |format|
      #   format.html { redirect_to root_path }
      #   format.js { }
      # end
      redirect_to root_path
      flash[:notice] = "Email créé"
    else
      redirect_to root_path
      flash[:notice] = "Please try again"
    end
  end

  def destroy

  end

  private

  def email_params
    params.permit(:object, :body)
  end

end
