class AnimalsController < ApplicationController
    # Story 1, part 2: Can see the data response of all the animals
    def index
        animals = Animal.all
        render json: animals, include: [:sightings]
    end

    def show
        animal = Animal.find(params[:id])
        render json: animal, include:[:sightings]
    end

    # Story 1, part 3: Can create a new animal in the database
    def create
        animal = Animal.create(animal_params)
        if animal.valid?
            render json: animal
        else
            render json: animal.errors
        end
    end


    #Story 1, part 4: Can update an existing animal in the database
    def update
        animal = Animal.find(params[:id]) 
        animal.update(animal_params)
        if animal.valid?
            render json: animal
        else
            render json: animal.errors
        end
    end

    #Story 1, part 5: Can remove an animal entry in the database
    def destroy
        animal = Animal.find(params[:id])
        if animal.destroy
            render json: animal
        else
            render json: animal.errors
        end
    end

    # Private will always go at the end
    private
    def animal_params
        params.require(:animal).permit(:common_name, :scientific_binomial)
    end




end
