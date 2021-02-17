class Admin::MembersController < Admin::Base
  before_action :login_required
  
  # 会員一覧
  def index
    @members = Member.order("number")
      .page(params[:page]).per(15)
  end

  # 検索
  def search
    @members = Member.search(params[:q])
      .page(params[:page]).per(15)
    if params["men"] && params["women"] then
      #何もしない
    elsif params["men"] then
      @members = @members.where(sex:1)
    elsif params["women"] then
      @members = @members.where(sex:2)
    end
    render "index"
  end

  # 会員情報の詳細
  def show
    @member = Member.find(params[:id]) 
    @duty = Duty.find_by(member_id: @member.id)
  end
  # 新規作成フォーム
  def new
    @member = Member.new(birthday: Date.new(1980, 1, 1))
  end

  def edit
    @member = Member.find(params[:id])
  end

  # 会員の新規登録
  def create
    @member = Member.new(params[:member])
    if @member.save
      redirect_to [:admin, @member], notice: "会員を登録しました。"
    else
      render "new"
    end
  end

  # 会員情報の更新
  def update
    @member = Member.find(params[:id])
    @member.assign_attributes(params[:member])
    if @member.save
      redirect_to [:admin, @member], notice: "会員情報を更新しました。"
    else
      render "edit"
    end
  end

  def destroy
    @member = Member.find(params[:id])
    @member.destroy
    redirect_to :admin_members, notice: "会員を削除しました。"
  end
end
