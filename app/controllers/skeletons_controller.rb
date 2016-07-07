class SkeletonsController < ScopedResourceController
  before_render :add_setting, only: [:new]

  def self.resource_name
    'skeletons'
  end

  protected
  # Never trust parameters from the scary internet, only allow the white list through.
  def skeleton_params
    params.require(:skeleton).permit(
      :name,
      :slug,
      settings_attributes: [:id, :_destroy, :type, :name, :value, :version_qualifier]
    )
  end

  def add_setting
    @skeleton.settings << RailsVersion.new
  end
end
