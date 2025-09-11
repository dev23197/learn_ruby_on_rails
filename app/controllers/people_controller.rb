class PeopleController < ApplicationController
  # This will raise an activeModel::ForbidddenAttributesError
  # because it's using mass assignmenst without and explicit permit
  def create
    Person.create(params[:person])
  end


 # this will work as we are using 'person_params' helper method
 # call to 'expert' to allow mass assignment

 def update
   person = Person.find(params[:id])
   person.update!(person_params)
   redirect_to person
 end


 private

 def person_params
 params.expect(person: [ :name, :age ])
 end
end
