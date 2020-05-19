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
      redirect_to works_path
      return
    end
  end

  def update
    @work = Work.find_by(id: params[:id])
    if @work.nil?
      head :not_found
      return
    elsif @work.update(
      work_params
    )
      redirect_to work_path(@work.id)
      flash[:success] = "Succesfully updated #{@work.category} #{@work.id}"
      return
    else 
     flash.now[:error] = "A problem occurred: Could not create #{@work.category}"
     render :edit, status: :bad_request
      return
    end
  end

  def new 
    @work= Work.new
  end

  def create
    @work = Work.new(
      work_params
    )
    if @work.save
      redirect_to work_path(@work.id)
      flash[:success] = "Succesfully created #{@work.category} #{@work.id}"
      return
    else
      flash.now[:error] = "A problem occurred: Could not create #{@work.category}"
      render :new, status: :bad_request
      return
    end
  end

  def destroy
    @work = Work.find_by(id: params[:id].to_i)
    if @work.nil?
      head :not_found
    return
    else
      @work.destroy
      redirect_to works_path
      flash[:success] = "Succesfully destroyed #{@work.category} #{@work.id}"
    end
  end

def upvote
   if session[:user_id]
    @work_id = Work.find_by(id: params[:id])
    if @work.votes.find_by(user_id: session[:user_id])
      redirect_to works_path
      flash[:error] = "#{session[:user_id]}:has aleady voted for this #{@work.category}"
     return
    else
      @work.new_vote(session[:user_id])
      redirect_to works_path
      flash[:success]= "Successfully upvoted!"
      return
    end
  else 
    redirect_to works_path
    flash[:error] = "A problem occurred:You must log in to do that"
  end
end

  private 
  def work_params 
    return params.require(:work).permit(:category, :title, :creator, :publication_year, :description)
  end
end