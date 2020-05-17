class WorksController < ApplicationController
  def index

    @works = Work.all
  end

  def show 
    @work = Work.find_by(id: params[:id].to_i)
    if @work.nil?
      redirect_to works_path
      return
    end
  end

  def edit
    @work = Work.find_by(id: params[:id])
    if @work.nil?
      head :not_found
      return
    end
  end
end

# def by_category
#   work = Work.category
#   if !work.nil?
#     @work = Work.where(category: "albums")
#   end
# end

private 
def work_params 
  return params.require(:work).permit(:category, :title, :creator, :publication_year, :description)
end
