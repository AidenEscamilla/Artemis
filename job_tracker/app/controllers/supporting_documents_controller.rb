class SupportingDocumentsController < ApplicationController
  before_action :set_supporting_document, only: %i[ show edit update destroy ]

  # GET /supporting_documents or /supporting_documents.json
  def index
    @supporting_documents = SupportingDocument.all
  end

  # GET /supporting_documents/1 or /supporting_documents/1.json
  def show
  end

  # GET /supporting_documents/new
  def new
    @supporting_document = SupportingDocument.new
  end

  # GET /supporting_documents/1/edit
  def edit
  end

  # POST /supporting_documents or /supporting_documents.json
  def create
    @supporting_document = SupportingDocument.new(
      name: supporting_document_params[:name],
      document: supporting_document_params[:document])
    

    respond_to do |format|
      if @supporting_document.save

        valid_ids = supporting_document_params[:job_application_ids].select { |app_id| app_id.blank? == false}
        valid_ids.each { |id|
          linker = DocumentLinker.new(
            job_application_id: id,
            supporting_document_id: @supporting_document.id)
          linker.save!
        }

        format.html { redirect_to supporting_document_url(@supporting_document), notice: "Supporting document was successfully created." }
        format.json { render :show, status: :created, location: @supporting_document }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @supporting_document.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /supporting_documents/1 or /supporting_documents/1.json
  def update
    respond_to do |format|
      if @supporting_document.update(
        name: supporting_document_params[:name],
        document: supporting_document_params[:document])

        valid_ids = supporting_document_params[:job_application_ids].select { |app_id| app_id.blank? == false}
        valid_ids.each { |id|
          linker = DocumentLinker.create!(
            job_application_id: id,
            supporting_document_id: @supporting_document.id)
        }

        format.html { redirect_to supporting_document_url(@supporting_document), notice: "Supporting document was successfully updated." }
        format.json { render :show, status: :ok, location: @supporting_document }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @supporting_document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /supporting_documents/1 or /supporting_documents/1.json
  def destroy
    @supporting_document.destroy!

    respond_to do |format|
      format.html { redirect_to supporting_documents_url, notice: "Supporting document was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_supporting_document
      @supporting_document = SupportingDocument.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def supporting_document_params

      params.require(:supporting_document).permit(:name, :document, :job_application_ids => [])
    end
end
