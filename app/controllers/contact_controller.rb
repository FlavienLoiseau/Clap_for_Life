class ContactController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new
    if @contact.save
      ContactMailer.contact_form(@contact).deliver_now
      redirect_to root_path, notice:"Votre email nous a bien été envoyé"
    else
      flash[:error] = "Une erreur est survenue"
      render :new
    end
  end


  private

  def contact_params
    params.require(:contact).permit(
      :first_name,
      :last_name,
      :email,
      :email_content
    )
  end
end
