class UsersController < ApplicationController

  skip_forgery_protection

  def create
    person_in_system?
  end

  def update
    visits = line_person.visits
    line_person.update(visits: visits + 1)
    render json: {:user => line_person, :code=>200, :message=>"Successful update of user!!"}
  end

  private

    def person_in_system?
      line_person ? update : set_up_user
    end

    def line_person
      User.find_by_picture(params[:picture])
    end

    def set_up_user
      user = User.new(name: params[:name], picture: params[:picture])
      if user.save
        render json: {:user => user, :code=>200, :message=>"Successful creation of new user!!"}
      else
        begin
          user.save!
        rescue ActiveRecord::RecordInvalid => e
          render json: {:code=>422, :message=>e}
        else
          render json: nil, status: :ok
        end
      end
    end

end
