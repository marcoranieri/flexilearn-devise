class IdentitiesController < ApplicationController

    before_action :find_identity, only: [ :show, :edit, :update, :destroy ]

  def index
  end

  def show
  end

  def new
    @identity = Identity.new
    authorize @identity
  end

  def create
    @identity = Identity.new(identity_params)
    @identity.tutor = current_tutor
    authorize @identity

    respond_to do | format |
      if @identity.save!
        format.html { redirect_to @identity.tutor, info: 'Identity was successfully created.' }
        format.json { render :show, status: :created, location: @identity }
      else
        format.html { render :new }
        format.json { render json: @identity.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do | format |
      if @identity.update(identity_params)
        format.html { redirect_to @identity.tutor, notice: 'Identity was successfully updated.' }
        format.json { render :show, status: :ok, location: @identity }
      else
        format.html { render :edit }
        format.json { render json: @identity.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @identity.destroy
    respond_to do | format |
      format.html { redirect_to @identity.tutor, alert: 'Identity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def find_identity
    @identity = Tutor.find(params[:id]).identity
    authorize @identity # Auth before_action :show, :edit, :update, :destroy
  end

  def identity_params
    params.require(:identity).permit(:id, :tutor_id, :name, :document_type, :document_number, :nationality, :expired, :notes, :photo)
  end

end
