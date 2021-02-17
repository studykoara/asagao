class AccountsController < ApplicationController
  before_action :login_required, except:[:new, :create]

  def show
    @member = current_member
    @duty = Duty.find_by(member_id: @member.id)
  end

  def edit
    @member = current_member
  end

  def update
    @member = current_member
    @member.assign_attributes(params[:account])
    if @member.save
      redirect_to :account, notice: "アカウント情報を更新しました。"
    else
      render "edit"
    end
  end

  # 新規作成フォーム
  def new
    @member = Member.new(birthday: Date.new(1980, 1, 1))
  end

  # 会員の新規登録
  def create
    @member = Member.new(params[:member])
    if @member.save
      cookies.signed[:member_id] = {value: @member.id, expires: 5.minutes.from_now}
      redirect_to root_path, notice: "会員を登録しました。"
    else
      render "new"
    end
  end

  # ストロング・パラメータ
  # private def account_params
  #   params.require(:account).permit(
  #     :new_profile_picture,
  #     :remove_profile_picture
  #   )
  # end
end
