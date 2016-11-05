class TestAttachmentsController < ApplicationController
  before_action :set_test_attachment, only: [:show, :edit, :update, :destroy]

  # GET /test_attachments
  # GET /test_attachments.json
  def index
    @test_attachments = TestAttachment.all
  end

  # GET /test_attachments/1
  # GET /test_attachments/1.json
  def show
  end

  # GET /test_attachments/new
  def new
    @test_attachment = TestAttachment.new
  end

  # GET /test_attachments/1/edit
  def edit
  end

  # POST /test_attachments
  # POST /test_attachments.json
  def create
    @test_attachment = TestAttachment.new(test_attachment_params)

    respond_to do |format|
      if @test_attachment.save
        format.html { redirect_to @test_attachment, notice: 'Test attachment was successfully created.' }
        format.json { render :show, status: :created, location: @test_attachment }
      else
        format.html { render :new }
        format.json { render json: @test_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /test_attachments/1
  # PATCH/PUT /test_attachments/1.json
  def update
    respond_to do |format|
      if @test_attachment.update(test_attachment_params)
        format.html { redirect_to @test_attachment.test, notice: 'Test attachment was successfully updated.' }
        format.json { render :show, status: :ok, location: @test_attachment }
      else
        format.html { render :edit }
        format.json { render json: @test_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /test_attachments/1
  # DELETE /test_attachments/1.json
  def destroy
    @test_attachment.destroy
    respond_to do |format|
      format.html { redirect_to test_attachments_url, notice: 'Test attachment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_test_attachment
      @test_attachment = TestAttachment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def test_attachment_params
      params.require(:test_attachment).permit(:attachment)
    end
end
