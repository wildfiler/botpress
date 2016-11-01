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
  end
end
