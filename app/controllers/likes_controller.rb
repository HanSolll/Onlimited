class LikesController < ApplicationController
  def like_toggle
    like= Like.find_by(user_id: current_user.id,
                                      item_id: params[:item_id])    # rake routes에서 봤던 post_id를 parameter로             주고 받는 형태
    if like.nil?   # like를 한 사람이 없다면 새로 만든다.
      Like.create(user_id: current_user.id,
                                item_id: params[:item_id])
    else   #like한 사람이 있다면 삭제한다.
      like.destroy
    end
    redirect_to :back
  end 

end
