class ContactsController < ApplicationController
  before_action :set_contact, only: [:show]

  def index
    if signed_in? && current_user.admin == true
      @contacts = Contact.all
    else
      redirect_to new_user_session_path, notice: "ログインしてください！"
    end
  end

  def new
    if signed_in?
      @contact = Contact.new
    else
      redirect_to new_user_session_path, notice: "ログインしてください！"
    end
  end

  def create
    # binding.irb
    @contact = Contact.new(contact_params)
    @contact.user_id = current_user.id

    # binding.irb
    # if params[:back]
    #   render :new
    # else
      if @contact.save
        redirect_to user_path(id: current_user.id), notice: "依頼しました！しばらくお待ちください…"
      else
        render :new
      end
    # end
  end

  def show
    if signed_in? && current_user.admin == true
      @contact = current_user.contacts.find_by(user_id: @contact.id)
    end
  end

  private
  def contact_params
    params.require(:contact).permit(:title, :content)
  end

  def set_contact
    @contact = Contact.find(params[:id])
    @user = User.find(params[:id])
  end

end
