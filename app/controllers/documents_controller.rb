class DocumentsController < ApplicationController

    # Pundit OFF - Prototype
    before_action :skip_authorization

    before_action :find_document, only: [ :show, :edit, :update, :destroy ]
    before_action :set_tutor, only: [ :index, :show, :edit, :update, :destroy ]

  def index
    # @documents = policy_scope(Document).where(" tutor_id = ?", params[:tutor_id])
    @documents = policy_scope(Document).where(tutor_id: 22)
  end

  def show
  end

  def new
    @document = Document.new
    authorize @document
  end

  def create
    @document = Document.new(document_params)

    # @document.tutor = current_tutor
    @document.tutor = Tutor.find(22) #PROTOTYPE

    authorize @document

    respond_to do | format |
      if @document.save!
        format.html { redirect_to @document.tutor, info: 'Document was successfully created.' }
        format.json { render :show, status: :created, location: @document }
      else
        format.html { render :new }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do | format |
      if @document.update(document_params)
        format.html { redirect_to @document.tutor, notice: 'Document was successfully updated.' }
        format.json { render :show, status: :ok, location: @document }
      else
        format.html { render :edit }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @document.destroy
    respond_to do | format |
      format.html { redirect_to @document.tutor, alert: 'Document was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_tutor
    @tutor = Tutor.find(params[:tutor_id])
    # authorize @tutor
  end

  def find_document
    @document = Document.find(params[:id])
    authorize @document # Auth before_action :show, :edit, :update, :destroy
  end

  def document_params
    params.require(:document).permit(:id, :tutor_id, :name, :institute, :description, :qualification, :achieved, :lvl, :years_of_experience, :photo)
  end
end
