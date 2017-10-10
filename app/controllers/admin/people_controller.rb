class Admin::PeopleController < Admin::AdminsController
  before_action :set_person, only: [:show, :edit, :update, :destroy]

  def index
    @q = Person.ransack(params[:q])
    @people = @q.result(distinct: true).order(:name).page params[:page]
  end

  def show
  end

  def new
    @person = Person.new
  end

  def edit
  end

  def create
    @person = Person.new(person_params)

    respond_to do |format|
      if @person.save
        format.html { redirect_to admin_person_path(@person), notice: 'Person was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to admin_person_path(@person), notice: 'Person was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @person.destroy
    respond_to do |format|
      format.html { redirect_to admin_people_url, notice: 'Person was successfully destroyed.' }
    end
  end

  private
    def set_person
      @person = Person.find(params[:id])
    end

    def person_params
      params.require(:person).permit(:name, :bio, :picture, :tmdb_id, :imdb_id,
                                    :birthday, :born_in)
    end
end
