class FormAttachmentsController < ApplicationController
  before_action :set_form_attachment, only: [:show, :edit, :update, :destroy]

  # GET /form_attachments
  # GET /form_attachments.json
  def index
    @form_attachments = FormAttachment.all
  end

  # GET /form_attachments/1
  # GET /form_attachments/1.json
  def show
  end

  # GET /form_attachments/new
  def new
    @form_attachment = FormAttachment.new
  end

  # GET /form_attachments/1/edit
  def edit
  end

  # POST /form_attachments
  # POST /form_attachments.json
  def create
    @form_attachment = FormAttachment.new(form_attachment_params)

    respond_to do |format|
      if @form_attachment.save
        format.html { redirect_to @form_attachment, notice: 'Form attachment was successfully created.' }
        format.json { render :show, status: :created, location: @form_attachment }
      else
        format.html { render :new }
        format.json { render json: @form_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /form_attachments/1
  # PATCH/PUT /form_attachments/1.json
  def update
    respond_to do |format|
      if @form_attachment.update(form_attachment_params)
        format.html { redirect_to @form_attachment, notice: 'Form attachment was successfully updated.' }
        format.json { render :show, status: :ok, location: @form_attachment }
      else
        format.html { render :edit }
        format.json { render json: @form_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /form_attachments/1
  # DELETE /form_attachments/1.json
  def destroy
    @form_attachment.destroy
    respond_to do |format|
      format.html { redirect_to form_attachments_url, notice: 'Form attachment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_form_attachment
      @form_attachment = FormAttachment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def form_attachment_params
      params.require(:form_attachment).permit(:form_id, :file)
    end
end
