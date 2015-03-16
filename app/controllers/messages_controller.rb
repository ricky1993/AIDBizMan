class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy,:recieved]

  # GET /messages
  # GET /messages.json


  def index
    @user=current_user
    @messages = current_user.message.where(:flag=>true).page(params[:page]).order(:created_at)
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
    @user=current_user
  end

  # GET /messages/new
  def new
    @message = current_user.message.new
  end

  # GET /messages/1/edit
  def edit
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = current_user.message.new(message_params)
    @message.flag=true
    @message.mark=false

    @message1=current_user.message.new(message_params)
    @message1.flag=false
    @message1.mark=false

    @message1.save

    respond_to do |format|
      if @message.save
        format.html { redirect_to @message, notice: '信件新建成功.' }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html { redirect_to @message, notice: '信件修改成功.' }
        format.json { render :show, status: :ok, location: @message }
      else
        format.html { render :edit }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url, notice: '信件删除成功.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:title, :content, :user_id, :tousername)
    end
end
