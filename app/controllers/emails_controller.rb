class EmailsController < ApplicationController
  def new
      
  end

  def index
    @emails = Email.all
  end

  def show

    @email_found = Email.find(params[:id])
    respond_to do |format|
      format.html { redirect_to show_path }
      format.js { redirect_to root_path }
end
  end

  def create 
    @email = Email.new(
      object: Faker::Lorem.sentence(3),
      body: Faker::Lorem.paragraph(2))

    if @email.save
      respond_to do |format|
        format.html { redirect_to root_path }
        format.js { }
      end
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
