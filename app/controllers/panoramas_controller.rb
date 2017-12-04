class PanoramasController < ApplicationController
  before_filter :require_user_signed_in, only: [:new, :edit, :create, :update, :destroy]
  before_action :set_panorama, only: [:show, :edit, :update, :destroy]

  # GET /panoramas
  # GET /panoramas.json
  def index
    @panoramas = Panorama.all
  end

  # GET /panoramas/1
  # GET /panoramas/1.json
  include ActionController::Live
  def show

  end

  # GET /panoramas/new
  def new
    @panorama = Panorama.new
  end

  # GET /panoramas/1/edit
  def edit
  end

  # POST /panoramas
  # POST /panoramas.json
  def create
    @panorama = Panorama.new(panorama_params)
    @panorama.user = current_user

    respond_to do |format|
      if @panorama.save
        format.html { redirect_to @panorama, notice: 'Panorama was successfully created.' }
        format.json { render :show, status: :created, location: @panorama }
      else
        format.html { render :new }
        format.json { render json: @panorama.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /panoramas/1
  # PATCH/PUT /panoramas/1.json
  def update
    respond_to do |format|
      if @panorama.update(panorama_params)
        format.html { redirect_to @panorama, notice: 'Panorama was successfully updated.' }
        format.json { render :show, status: :ok, location: @panorama }
      else
        format.html { render :edit }
        format.json { render json: @panorama.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /panoramas/1
  # DELETE /panoramas/1.json
  def destroy
    @panorama.destroy
    respond_to do |format|
      format.html { redirect_to panoramas_url, notice: 'Panorama was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def instantiate_stitch
    # Instead, lets start with match-n-shift
    
    # Step 1: Generate PTO via match-n-shift w/ CSV of files, yprxyz
    # `match-n-shift --input job_5.csv -o project.pto --projection 0 --fov 66`
    `pto_gen public/uploads/panorama/photos/#{params[:id]}/* -o project.pto`
    `pto_var --set=y=0,p=90,r=0,TrX=i==1?0:i*0.4,TrY=0,TrZ=1 --opt=TrX,TrY 1-1.JPG 1-2.JPG 1-3.JPG 1-4.JPG project.pto`
    `pto_var --set=y=0,p=90,r=0,TrX=i==1?0:i*0.4,TrY=0.6,TrZ=1 --opt=TrX,TrY 2-1.JPG 2-2.JPG 2-3.JPG 2-4.JPG project.pto`
    `pto_var --set=y=0,p=90,r=0,TrX=i==1?0:i*0.4,TrY=1.2,TrZ=1 --opt=TrX,TrY 3-1.JPG 3-2.JPG 3-3.JPG 3-4.JPG project.pto`
    `pto_var --set=y=0,p=90,r=0,TrX=i==1?0:i*0.4,TrY=1.8,TrZ=1 --opt=TrX,TrY 4-1.JPG 4-2.JPG 4-3.JPG 4-4.JPG project.pto`
    `cpfind -o project.pto --fullscale --multirow --prealigned project.pto`
    
    
    
    # Step 2: Arrange as Multi-row panorama with stacks
    # `cpfind -o project.pto --multirow --prealigned project.pto`
    
    
    # `pto_gen public/uploads/panorama/photos/#{params[:id]}/* -o project.pto`
    # `cpfind -o project.pto --multirow --celeste project.pto`
    # `cpclean -o project.pto project.pto`
    # `linefind -o project.pto project.pto`
    # `autooptimiser -a -m -l -s -o project.pto project.pto`
    # `pano_modify --canvas=AUTO --crop=AUTO -o project.pto project.pto`
    # `hugin_executor --stitching --prefix=prefix project.pto`
    # `nona -m PNG -o project-#{params[:id]} project.pto`
    # `rm project.pto`
    # `mv project-#{params[:id]}.png ./public/`
    
    redirect_to panorama_path(params[:id])
  end

  # def instantiate_stitch
  #   response.headers['Content-Type'] = 'text/event-stream'
  #   3.times {
  #     response.stream.write "data: hello world\n\n", 'stitch_event'
  #     sleep 1
  #   }
  # rescue IOError
  #   Rails.logger.info 'Stitching stream closed'
  # ensure
  #   response.stream.close
  # end

  private

  def set_panorama
    @panorama = Panorama.find(params[:id])
  end

  def panorama_params
    params.require(:panorama).permit(:name, photos: [])
  end
end


'IMG_7551.JPG y p r x y 1'

'demo/1-1.JPG, 0, 0, 0, 0.0, 0.0, 1.0'
'demo/1-2.JPG, 0, 0, 0, 0.4, 0.6, 1.0'
'demo/1-3.JPG, 0, 0, 0, 0.8, 1.2, 1.0'
'demo/1-4.JPG, 0, 0, 0, 1.2, 1.8, 1.0'
'demo/2-1.JPG, 0, 0, 0, 0.0, 2.4, 1.0'
'demo/2-2.JPG, 0, 0, 0, 0.4, 3.0, 1.0'
'demo/2-3.JPG, 0, 0, 0, 0.8, 3.6, 1.0'
'demo/2-4.JPG, 0, 0, 0, 1.2, 4.2, 1.0'
'demo/3-1.JPG, 0, 0, 0, 0.0, 4.8, 1.0'
'demo/3-2.JPG, 0, 0, 0, 0.4, 5.4, 1.0'
'demo/3-3.JPG, 0, 0, 0, 0.8, 6.0, 1.0'
'demo/3-4.JPG, 0, 0, 0, 1.2, 6.6, 1.0'
'demo/4-1.JPG, 0, 0, 0, 0.0, 7.2, 1.0'
'demo/4-2.JPG, 0, 0, 0, 0.4, 7.8, 1.0'
'demo/4-3.JPG, 0, 0, 0, 0.8, 8.4, 1.0'
'demo/4-4.JPG, 0, 0, 0, 1.2, 9.0, 1.0'



















# IMG_7551.JPG IMG_7553.JPG IMG_7554.JPG IMG_7555.JPG IMG_7556.JPG IMG_7557.JPG IMG_7558.JPG IMG_7559.JPG IMG_7560.JPG IMG_7561.JPG IMG_7562.JPG IMG_7563.JPG IMG_7564.JPG IMG_7565.JPG IMG_7566.JPG IMG_7567.JPG
