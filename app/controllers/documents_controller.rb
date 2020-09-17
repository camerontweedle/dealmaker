# frozen_string_literal: true

# Documents
class DocumentsController < ApplicationController
  before_action :set_document, only: %i[show edit update destroy]
  before_action :set_template, only: %i[show new edit update create index update]

  # GET /documents
  # GET /documents.json
  def index
    @documents = Document.all
  end

  # GET /documents/1
  # GET /documents/1.json
  def show
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: 'document.pdf',
               disposition: 'inline',
               template: 'documents/show.pdf.erb'
      end
    end
  end

  # GET /documents/new
  def new
    @document = Document.new
  end

  # GET /documents/1/edit
  def edit; end

  # POST /documents
  # POST /documents.json
  def create
    @document = create_with_answers

    respond_to do |format|
      if @document.save
        format.html { redirect_to template_document_path(@document.template_id, @document), notice: 'Document created' }
        format.json { render :show, status: :created, location: @document }
      else
        format.html { render :new }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /documents/1
  # PATCH/PUT /documents/1.json
  def update
    respond_to do |format|
      if @document.update(document_params)
        format.html { redirect_to template_document_path(@document.template_id, @document), notice: 'Document updated' }
        format.json { render :show, status: :ok, location: @document }
      else
        format.html { render :edit }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /documents/1
  # DELETE /documents/1.json
  def destroy
    @document.destroy
    respond_to do |format|
      format.html { redirect_to template_documents_url, notice: 'Document was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_document
    @document = Document.find(params[:id])
  end

  def set_template
    @template = Template.find(params[:template_id])
  end

  def create_with_answers
    @document = Document.new(document_params)
    params[:document]['answers']&.each do |q, answer|
      a = Answer.new({ question_id: q, content: answer })
      @document.answers << a
    end
    @document.status = 'complete' if @document.answers.count == @template.questions.count
    @document
  end

  # Only allow a list of trusted parameters through.
  def document_params
    params.require(:document).permit(:status, :output, :template_id)
  end
end
