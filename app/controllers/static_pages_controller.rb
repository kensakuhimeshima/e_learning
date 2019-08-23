class StaticPagesController < ApplicationController
  def home
    begin
    @feeds = current_user.dashboard_feed.paginate(page: params[:page], per_page: 10).order(created_at: :desc)
    rescue
    end
  end
end
