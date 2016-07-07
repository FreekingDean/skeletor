class Api::SkeletonsController < ApiController
  before_action :set_skeleton, only: [:show]
  def show
    render json: @skeleton
  end

  private
  def set_skeleton
    @skeleton = Skeleton.find_by(slug: params[:id])
  end
end
