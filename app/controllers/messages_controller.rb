#List, send, delete, create new messages
class MessagesController < ApplicationController
  respond_to :html, :json
  before_filter :authenticate_user!
  #before_filter :get_user_id

  #Displaying received and sent messages
  def index
    user_id = get_user_id
    @messages_sent_by_current = Message.find_all_by_sender_id(user_id)
    @messages_received_by_current = Message.find_all_by_recipient_id(user_id)
    @recipient_id=Array.new
    @messages_sent_by_current.each do |message|
      if @recipient_id.index(message.recipient_id) != -1
        @recipient_id.push message.recipient_id
      end
    end
    @sender_id = Array.new
    @messages_received_by_current.each do |message|
      if @sender_id.index(message.sender_id) != -1
        @sender_id.push message.sender_id
      end
    end
    @people_unmerged = @sender_id.concat(@recipient_id)
    @people = @people_unmerged.uniq

    # Find conversations
    @users=Array.new
    @messages = {}
    @people.each do |p|
      if(User.find(p))
        @users.push p
        @message_from  = Message.find_all_by_recipient_id_and_sender_id(p, user_id)
        @message_to = Message.find_all_by_recipient_id_and_sender_id(user_id, p)
        @message_from.concat(@message_to)
        @message_from = @message_from.sort_by {|hsh| hsh.created_at}
        @messages[p] = @message_from
      end
    end
 #
 # if @messages_sent.count == 0
  #  flash[:notice] = "No messages!"
   #end
  end

  #Show message of particular user
  def show
    @message = Message.find(params[:id])
    respond_with(@message)
  end

  #Compose new message
  def new
    if current_user
    @message = Message.new
    @message.recipient_id=params[:recipient_id]
    #respond_with(@message)
    if !Message.find_all_by_recipient_id_and_sender_id(@message.recipient_id, get_user_id).empty?
      redirect_to user_messages_path
    end
    else
      flash[:notice] = "User should be signed in"
    end

  end

  #TBD : Don't need this for now
  def edit

  end

  #TBD : Don't need this now
  def update

  end

  # System generated message for rejected offers
  def self system_message
    @message= Message.new
    @message.sender_id=0
    @message.recipient_id=@offer.buyer_id
    @message.subject="Sorry"
    @message.body="offer rejected."
    @message.save
  end

  #Send message
  def create
    #can't refactor this part of the code as sender_id reference is not
    #same as user_id ie we can't execute method current_user.messages
    @message = Message.new(params[:message])
    @message.sender_id = current_user.id
    respond_to do |format|
      if @message.save
        format.html { redirect_to user_messages_path, notice: 'Message sent!' }
        format.json { render json: @message, status: :created, location: @message }
      else
        format.html { render "new" }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  #TBD: Not required for now
  def destroy

  end
end