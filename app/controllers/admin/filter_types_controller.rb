module Admin
  class FilterTypesController < AdminController
    def index
      @filter_types = FilterType.all.
                      includes(:filter_values).
                      paginate(page: params[:page])
    end

    def show
      @filter_type = FilterType.find(params[:id])
    end

    def new
      @filter_type = FilterType.new
      @filter_type.filter_values.build
    end

    def create
      @filter_type = FilterType.new(filter_type_params)
      if @filter_type.save
        redirect_to admin_filter_type_path(@filter_type)
      else
        render :new
      end
    end

    private

    def filter_type_params
      params.require(:filter_type).permit(:name,
                                          :game_id,
                                          filter_values_attributes:[
                                            :name,
                                            :filter_type_id
                                          ])
    end
  end
end
