class Backends::PassengerInfosController < BackendsController
  before_action :find_passenger_info , only: [:edit,:update]
  skip_before_filter :verify_authenticity_token, only: [:auto_add_tag]
  def index

    @passenger_infos = PassengerInfo.all.map do |passenger|
      {id: passenger.id, psgr_no: passenger.psgr_no, name: passenger.name, major: passenger.major, email: passenger.email,
       tags: passenger.tag_id.map do |tag|
        Tag.find(tag).content
       end
      }
      end
      
    @passenger_infos = JSON.parse(@passenger_infos.to_json)      
  end

  # TODO: edit tag
  def edit
    @tags = Tag.all.map do |tag|
      {tag_id: tag.id , tag_content: tag.content}
    end
    @tags = JSON.parse(@tags.to_json)
    @selected_tags = @passenger_info.tag_id
  end

  def update
    @passenger_info.update(passenger_info_params_permit)  
    redirect_to backends_passenger_infos_path , flash: { success: '修改成功'}
  end

  def auto_add_tag
    @tag = Tag.create(content: params[:tag_name])
    render json: @tag
    return
  end

  private

  def passenger_info_params_permit
    params.require(:passenger_info).permit(:name, :major, :email, :tag_id => [])
  end

  def find_passenger_info
    @passenger_info = PassengerInfo.find_by(id: params[:id])
  end
end
