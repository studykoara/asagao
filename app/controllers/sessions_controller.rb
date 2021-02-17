class SessionsController < ApplicationController
  def create
    member = Member.find_by(name: params[:name])
    if member&.authenticate(params[:password])
      # session[:member_id] = member.id
      cookies.signed[:member_id] = {
        :value => member.id,
        :expires => 15.minutes.from_now,
      }
    else
      flash.alert = "名前とパスワードが一致しません"
    end

    redirect_to :root
  end

  def destroy
    # session.delete(:member_id)
    cookies.delete(:member_id)
    redirect_to :root
  end
end
