class TestingController < ApplicationController
  respond_to :js

  def new
  end

  def track
    if params[:pageIndex].present?
      active = @user.actives.create
      active.index = params[:pageIndex]
      active.answer = params[:test_answer]
      active.standing_time = Time.now.tv_sec - (params[:standing_time].to_i)
      active.save
    end
    respond_with active do |format|
      format.html
      format.js
    end
  end
end
