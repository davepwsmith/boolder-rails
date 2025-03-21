class Admin::AreasController < Admin::BaseController
  def index
    sort = params[:sort] == "id" ? :id : :name
    @areas = Area.order(sort)
  end

  def edit
    set_area
  end

  def new
    @area = Area.new
  end

  def create
    @area = Area.new
    @area.assign_attributes(area_params)
    @area.tags = params[:area][:tags].split(",")
    if @area.save
      flash[:notice] = "Area Created"
      redirect_to [ :admin, @area ]
    else
      flash[:error] = @area.errors.full_messages.join("; ")
      render "edit", status: :unprocessable_entity
    end
  end

  def show
    set_area
    redirect_to admin_area_problems_path(@area, circuit_id: "first")
  end

  def update
    set_area

    @area.assign_attributes(area_params)
    # if @area.tags.empty?
    #   @area.tags = params[:area][:tags].split(",")
    # else
    #   @area.tags = nil
    # end

    if cover = params[:area][:cover]
      @area.cover = params[:area][:cover]
    end

    if @area.save
      flash[:notice] = "Area updated"
      redirect_to edit_admin_area_path(@area)
    else
      flash[:error] = @area.errors.full_messages.join("; ")
      render "edit", status: :unprocessable_entity
    end
  end

  private
  def area_params
    params.require(:area).
      permit(:name, :cluster_id, :tags, :slug, :published, :priority, :short_name, :description_fr, :description_en, :warning_fr, :warning_en)
  end

  def set_area
    @area = Area.find_by(slug: params[:slug])
  end
end
