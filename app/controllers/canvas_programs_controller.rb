class CanvasProgramsController < ApplicationController
  before_action :authenticate_admin!
  skip_before_action :authenticate_admin!, only: [:index, :show]

  def index
    @canvas_programs = CanvasProgram.all
  end

  def show
    @canvas_program = CanvasProgram.find(params[:id])
  end

  def new
    @canvas_program = CanvasProgram.new
  end

  def create
    @canvas_program = CanvasProgram.new(canvas_program_params)
    if @canvas_program.save
      redirect_to canvas_programs_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @canvas_program = CanvasProgram.find(params[:id])
  end

  def update
    @canvas_program = CanvasProgram.find(params[:id])

    if @canvas_program.update(canvas_program_params)
      redirect_to @canvas_program
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @canvas_program = CanvasProgram.find(params[:id])
    @canvas_program.destroy

    redirect_to root_path, status: :see_other
  end

  private
  def canvas_program_params
    params.require(:canvas_program).permit(:name, :body)
  end
end
