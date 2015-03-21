class ApplyRecordsController < ApplicationController
  before_action :set_apply_record, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /apply_records
  # GET /apply_records.json
  def index
    if current_user.admin
      redirect_to :controller => "admin",:action => "index"
    end
    if current_user.job=="客服人员"
      apply_records = ApplyRecord.where(:user => current_user.username).page(params[:page]).order(:created_at=>:desc)
      @apply_records = apply_records.where.not(:state=>"证书签发完毕").page(params[:page]).order(:created_at=>:desc)
      #@apply_records2 = ApplyRecord.where(["user = ? and state = ?",current_user.username,"证书签发完毕"]).page(params[:page]).order(:created_at=>:desc)
    elsif current_user.job=="作品库管员"
      @apply_records=ApplyRecord.where(:itemsave => current_user.username, :state =>["申请通过","物品交接中" ,"物品已入库","物品送往备案","采样中","采样完毕","备案物品归还"]).page(params[:page]).order(:created_at=>:desc)
      #@apply_records2=ApplyRecord.where(["state = ? and itemsave = ?", "证书签发完毕", current_user.username]).page(params[:page]).order(:created_at=>:desc)
    elsif current_user.job=="作品备案认证人员"
      @apply_records=ApplyRecord.where(:sample => current_user.username,  :state =>["物品已入库","物品送往备案","采样中"]).page(params[:page]).order(:created_at=>:desc)
      apply_records=ApplyRecord.where.not(:state => ["等待处理","物品已入库","物品送往备案","采样中"]).page(params[:page]).order(:created_at=>:desc)
      #@apply_records2=apply_records.where(:sample=>"admin3")
    elsif current_user.job=="草拟与证书发送人员"
      @apply_records=ApplyRecord.where(:issue => current_user.username,  :state =>["采样完毕","备案物品归还","物品已出库","证书签发中"]).page(params[:page]).order(:created_at=>:desc)
      #@apply_records2=ApplyRecord.where(:state => "证书签发完毕").page(params[:page]).order(:created_at=>:desc)
    elsif current_user.admin
      @apply_records=ApplyRecord.page(params[:page]).order(:created_at=>:desc)
    end
    @count=0;
  end

  # GET /apply_records/1
  # GET /apply_records/1.json
  def show
    if current_user.job=="客服人员"
      @apply_record.shenqingtime=@apply_record.updated_at.localtime.to_s(:db)
    elsif current_user.job=="作品库管员"
      @apply_record.itemsave=current_user.username
      if @apply_record.state=="物品已入库"
        @apply_record.intime=@apply_record.updated_at.localtime.to_s(:db)
      elsif @apply_record.state=="物品送往备案"
        @apply_record.sampletime=@apply_record.updated_at.localtime.to_s(:db)
      elsif @apply_record.state1=="备案物品归还"
        @apply_record.returntime=@apply_record.updated_at.localtime.to_s(:db)
      elsif @apply_record.state1=="物品已出库"
        @apply_record.outtime=@apply_record.updated_at.localtime.to_s(:db)
      end

    elsif current_user.job=="作品备案认证人员"
      @apply_record.sample=current_user.username
    elsif current_user.job=="草拟与证书发送人员"
      @apply_record.issue=current_user.username
      if @apply_record.isprint=="已打印"
        @apply_record.printtime=@apply_record.updated_at.localtime.to_s(:db)
      end
      if @apply_record.isissue=="已签发"
        @apply_record.issuetime=@apply_record.updated_at.localtime.to_s(:db)
      end

    end

    @apply_record.save
  end

  # GET /apply_records/new
  def new
    @apply_record = ApplyRecord.new
  end

  # GET /apply_records/1/edit
  def edit
  end

  # POST /apply_records
  # POST /apply_records.json
  def create
    @apply_record = ApplyRecord.new(apply_record_params)
    @apply_record.user=current_user.username
    if @apply_record.state==""
      @apply_record.state="等待处理"
    end
    @apply_record.save
    b=@apply_record.created_at.localtime.to_s(:db)
    str= b[0..3]+ b[5..6]+ b[8..9]+ b[11..12]+ b[14..15]+ b[17..18]+@apply_record.id.to_s
    @apply_record.dingdanhao=str


    respond_to do |format|
      if @apply_record.save
        format.html { redirect_to @apply_record, notice: '订单申请成功.' }
        format.json { render :show, status: :created, location: @apply_record }
      else
        format.html { render :new }
        format.json { render json: @apply_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /apply_records/1
  # PATCH/PUT /apply_records/1.json
  def update
    respond_to do |format|
      if @apply_record.update(apply_record_params)
        format.html { redirect_to @apply_record, notice: '订单修改成功.' }
        format.json { render :show, status: :ok, location: @apply_record }
      else
        format.html { render :edit }
        format.json { render json: @apply_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /apply_records/1
  # DELETE /apply_records/1.json
  def destroy
    @apply_record.destroy
    respond_to do |format|
      format.html { redirect_to apply_records_url, notice: '订单删除成功.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_apply_record
      @apply_record = ApplyRecord.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def apply_record_params
      params.require(:apply_record).permit(:personname, :personcategory, :item, :artcategory, :artname, :state,:image, :macroimage, :microimage, :qrimage, :isprint, :isissue, :paid,:state1,:advice,:idtype,:idnumber,:idimage)
    end
end
