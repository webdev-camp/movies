class PeopleController < AuthenticatedController

  def show
    @person = Person.find(params[:id])
  end
end
